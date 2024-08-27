// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(address _priceOracle1, address _priceOracle2)
        external
        returns (uint256)
    {
        (bool ok1, bytes memory result1) = _priceOracle1.call(
            abi.encodeWithSignature("price()")
        );
        (bool ok2, bytes memory result2) = _priceOracle2.call(
            abi.encodeWithSignature("price()")
        );
        require(ok1 && ok2, "A call failed");

        uint256 price1 = abi.decode(result1, (uint256));
        uint256 price2 = abi.decode(result2, (uint256));

        return price1 < price2 ? price1 : price2;
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
