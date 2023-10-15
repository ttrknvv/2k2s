import React, { useState } from "react";

interface NumberProps {
    array?: number[]
}

const Numbers = ({array = []} : NumberProps) => {

return (<ul>{array.map(el => <li>{el}</li>)}</ul>)

}
export default Numbers;
