// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";

import { IDevSystem } from "./IDevSystem.sol";
import { IBuildSystem } from "./IBuildSystem.sol";
import { IConnectSystem } from "./IConnectSystem.sol";
import { IDestroySystem } from "./IDestroySystem.sol";
import { IDisconnectSystem } from "./IDisconnectSystem.sol";
import { IResolveSystem } from "./IResolveSystem.sol";
import { IWipeSystem } from "./IWipeSystem.sol";
import { IOfferSystem } from "./IOfferSystem.sol";
import { IOrderSystem } from "./IOrderSystem.sol";
import { IGraduateSystem } from "./IGraduateSystem.sol";
import { ISpawnSystem } from "./ISpawnSystem.sol";
import { IStartSystem } from "./IStartSystem.sol";
import { ITankSystem } from "./ITankSystem.sol";
import { ITokenTankSystem } from "./ITokenTankSystem.sol";

/**
 * @title IWorld
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @notice This interface integrates all systems and associated function selectors
 * that are dynamically registered in the World during deployment.
 * @dev This is an autogenerated file; do not edit manually.
 */
interface IWorld is
  IBaseWorld,
  IDevSystem,
  IBuildSystem,
  IConnectSystem,
  IDestroySystem,
  IDisconnectSystem,
  IResolveSystem,
  IWipeSystem,
  IOfferSystem,
  IOrderSystem,
  IGraduateSystem,
  ISpawnSystem,
  IStartSystem,
  ITankSystem,
  ITokenTankSystem
{}