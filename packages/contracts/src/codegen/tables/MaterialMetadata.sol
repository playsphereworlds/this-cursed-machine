// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

// Import user types
import { MaterialId } from "./../../libraries/LibMaterial.sol";
import { MATERIAL_DIFFICULTY } from "./../common.sol";

struct MaterialMetadataData {
  MATERIAL_DIFFICULTY difficulty;
  address tokenAddress;
  string name;
}

library MaterialMetadata {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "MaterialMetadata", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746200000000000000000000000000004d6174657269616c4d65746164617461);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0015020101140000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes14)
  Schema constant _keySchema = Schema.wrap(0x000e01004d000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (uint8, address, string)
  Schema constant _valueSchema = Schema.wrap(0x001502010061c500000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "materialId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "difficulty";
    fieldNames[1] = "tokenAddress";
    fieldNames[2] = "name";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get difficulty.
   */
  function getDifficulty(MaterialId materialId) internal view returns (MATERIAL_DIFFICULTY difficulty) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return MATERIAL_DIFFICULTY(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get difficulty.
   */
  function _getDifficulty(MaterialId materialId) internal view returns (MATERIAL_DIFFICULTY difficulty) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return MATERIAL_DIFFICULTY(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set difficulty.
   */
  function setDifficulty(MaterialId materialId, MATERIAL_DIFFICULTY difficulty) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(difficulty)), _fieldLayout);
  }

  /**
   * @notice Set difficulty.
   */
  function _setDifficulty(MaterialId materialId, MATERIAL_DIFFICULTY difficulty) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(difficulty)), _fieldLayout);
  }

  /**
   * @notice Get tokenAddress.
   */
  function getTokenAddress(MaterialId materialId) internal view returns (address tokenAddress) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get tokenAddress.
   */
  function _getTokenAddress(MaterialId materialId) internal view returns (address tokenAddress) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set tokenAddress.
   */
  function setTokenAddress(MaterialId materialId, address tokenAddress) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((tokenAddress)), _fieldLayout);
  }

  /**
   * @notice Set tokenAddress.
   */
  function _setTokenAddress(MaterialId materialId, address tokenAddress) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((tokenAddress)), _fieldLayout);
  }

  /**
   * @notice Get name.
   */
  function getName(MaterialId materialId) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Get name.
   */
  function _getName(MaterialId materialId) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /**
   * @notice Set name.
   */
  function setName(MaterialId materialId, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /**
   * @notice Set name.
   */
  function _setName(MaterialId materialId, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, bytes((name)));
  }

  /**
   * @notice Get the length of name.
   */
  function lengthName(MaterialId materialId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of name.
   */
  function _lengthName(MaterialId materialId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of name.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemName(MaterialId materialId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Get an item of name.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemName(MaterialId materialId, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /**
   * @notice Push a slice to name.
   */
  function pushName(MaterialId materialId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Push a slice to name.
   */
  function _pushName(MaterialId materialId, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from name.
   */
  function popName(MaterialId materialId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop a slice from name.
   */
  function _popName(MaterialId materialId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update a slice of name at `_index`.
   */
  function updateName(MaterialId materialId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of name at `_index`.
   */
  function _updateName(MaterialId materialId, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(MaterialId materialId) internal view returns (MaterialMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(MaterialId materialId) internal view returns (MaterialMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    MaterialId materialId,
    MATERIAL_DIFFICULTY difficulty,
    address tokenAddress,
    string memory name
  ) internal {
    bytes memory _staticData = encodeStatic(difficulty, tokenAddress);

    EncodedLengths _encodedLengths = encodeLengths(name);
    bytes memory _dynamicData = encodeDynamic(name);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    MaterialId materialId,
    MATERIAL_DIFFICULTY difficulty,
    address tokenAddress,
    string memory name
  ) internal {
    bytes memory _staticData = encodeStatic(difficulty, tokenAddress);

    EncodedLengths _encodedLengths = encodeLengths(name);
    bytes memory _dynamicData = encodeDynamic(name);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(MaterialId materialId, MaterialMetadataData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.difficulty, _table.tokenAddress);

    EncodedLengths _encodedLengths = encodeLengths(_table.name);
    bytes memory _dynamicData = encodeDynamic(_table.name);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(MaterialId materialId, MaterialMetadataData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.difficulty, _table.tokenAddress);

    EncodedLengths _encodedLengths = encodeLengths(_table.name);
    bytes memory _dynamicData = encodeDynamic(_table.name);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (MATERIAL_DIFFICULTY difficulty, address tokenAddress) {
    difficulty = MATERIAL_DIFFICULTY(uint8(Bytes.getBytes1(_blob, 0)));

    tokenAddress = (address(Bytes.getBytes20(_blob, 1)));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  ) internal pure returns (string memory name) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    name = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (MaterialMetadataData memory _table) {
    (_table.difficulty, _table.tokenAddress) = decodeStatic(_staticData);

    (_table.name) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(MaterialId materialId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(MaterialId materialId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(MATERIAL_DIFFICULTY difficulty, address tokenAddress) internal pure returns (bytes memory) {
    return abi.encodePacked(difficulty, tokenAddress);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(string memory name) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(bytes(name).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(string memory name) internal pure returns (bytes memory) {
    return abi.encodePacked(bytes((name)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    MATERIAL_DIFFICULTY difficulty,
    address tokenAddress,
    string memory name
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(difficulty, tokenAddress);

    EncodedLengths _encodedLengths = encodeLengths(name);
    bytes memory _dynamicData = encodeDynamic(name);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(MaterialId materialId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(MaterialId.unwrap(materialId));

    return _keyTuple;
  }
}
