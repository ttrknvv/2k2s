import { useState } from "react";
import IFilter from "./IFilter";
import { setFilter as addFilter } from "../../../redux/actions/filtAction";
import { connect } from "react-redux";
import { Box, Typography, IconButton, Radio, RadioGroup, FormControlLabel } from '@mui/material'

const Filter = ({ img, variables, dispatch } : IFilter) => {
    const [selectedFilter, setFilter] = useState(variables.at(0));
    const [showVariables, setShowVariables] = useState(false);

    const handleToggleVariables = () => {
        setShowVariables(!showVariables);
      };

    const onVariable = (filter : string) => {
        console.log(dispatch)
        setFilter(filter);
        dispatch(addFilter(filter));
    }

    return (
    <Box className="filter" display="flex" alignItems="center">
        <IconButton onClick={handleToggleVariables}>
          <img src={img} alt="" />
        </IconButton>
        <Typography className="filter-text" onClick={handleToggleVariables}>
          {selectedFilter}
        </Typography>

        {showVariables && (
          <Box className="variables">
            <RadioGroup>
              {variables.map((el, index) => (
                <FormControlLabel
                  key={index}
                  value={el}
                  control={<Radio size={ "small" } />}
                  label=
                  {
                    <span className="text">
                        {el}
                    </span>
                  }
                  className="text"  
                  onClick={() => onVariable(el)}
                />
              ))}
            </RadioGroup>
          </Box>
        )}
  </Box>
);
}

export default connect()(Filter);