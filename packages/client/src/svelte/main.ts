import "./app.css"
import App from "./App.svelte"
import { mount as mountAccountKit } from "@latticexyz/account-kit/bundle"
import { createConfig, http } from "@wagmi/core"
import { getNetworkConfig } from "@mud/getNetworkConfig"
import { ENVIRONMENT } from "@mud/enums"
import { supportedChains } from "@mud/supportedChains"
import { transportObserver } from "@latticexyz/common"
import { Chain, fallback, webSocket } from "viem"

const getEnvironment = () => {
  const urlParams = new URLSearchParams(window.location.search)
  const chainId = urlParams.get("chainId")
  switch (chainId) {
    case "17069":
      return ENVIRONMENT.GARNET
    case "690":
      return ENVIRONMENT.REDSTONE
    default:
      if (urlParams.has("useAccountKit")) {
        return ENVIRONMENT.REDSTONE
      } else {
        switch (window.location.hostname) {
          case "thiscursedmachine.fun":
            return ENVIRONMENT.REDSTONE
          case "redstone-preview.thiscursedmachine.fun":
            return ENVIRONMENT.REDSTONE
          case "redstone-test.thiscursedmachine.fun":
            return ENVIRONMENT.REDSTONE_TEST
          case "garnet.thiscursedmachine.fun":
            return ENVIRONMENT.GARNET
          case "poetic-arithmetic-6cc2ce.netlify.app":
            return ENVIRONMENT.GARNET
          case "garnet-account-kit.thiscursedmachine.fun":
            return ENVIRONMENT.GARNET_ACCOUNT_KIT
          default:
            const urlParams = new URLSearchParams(window.location.search)
            if (urlParams.has("useAccountKit")) {
              return ENVIRONMENT.REDSTONE
            } else {
              return ENVIRONMENT.DEVELOPMENT
            }
        }
      }
  }


}

const environment = getEnvironment()

const networkConfig = getNetworkConfig(environment)

// only include foundry chain in development
const chains =
  environment === ENVIRONMENT.DEVELOPMENT ||
    environment === ENVIRONMENT.DEVELOPMENT_ACCOUNT_KIT
    ? supportedChains
    : supportedChains.filter(c => c.id !== 31337)

const wagmiConfig = createConfig({
  chains: chains as readonly [Chain, ...Chain[]],
  pollingInterval: 1_000,
  // TODO: how to properly set up a transport config for all chains supported as bridge sources?
  transports: Object.fromEntries(
    chains.map(chain => {
      if (chain.rpcUrls.default.webSocket)
        return [chain.id, transportObserver(fallback([webSocket(), http()]))]
      return [chain.id, transportObserver(http())]
    })
  ),
})

// console.log("networkConfig", networkConfig)

mountAccountKit({
  wagmiConfig,
  accountKitConfig: {
    theme: "dark",
    worldAddress: networkConfig.worldAddress,
    erc4337: false,
    chainId: networkConfig.chainId,
    appInfo: {
      name: "This Cursed Machine",
    },
  },
})

// import * as Sentry from "@sentry/svelte"

// Sentry.init({
//   environment: "staging",
//   // environment: "development",
//   dsn: "https://b051335e30dca124d200533a100e6892@o433904.ingest.us.sentry.io/4507126123921408",
//   integrations: [
//     Sentry.browserTracingIntegration(),
//     Sentry.replayIntegration(),
//   ],
//   // Performance Monitoring
//   tracesSampleRate: 1.0, //  Capture 100% of the transactions
//   // Set 'tracePropagationTargets' to control for which URLs distributed tracing should be enabled
//   tracePropagationTargets: ["localhost", /^https:\/\/yourserver\.io\/api/],
//   // Session Replay
//   replaysSessionSampleRate: 0.1, // This sets the sample rate at 10%. You may want to change it to 100% while in development and then sample at a lower rate in production.
//   replaysOnErrorSampleRate: 1.0, // If you're not already sampling the entire session, change the sample rate to 100% when sampling sessions where errors occur.
// })

const app = new App({
  target: document.getElementById("app"),
  props: {
    environment,
  },
})

export default app
