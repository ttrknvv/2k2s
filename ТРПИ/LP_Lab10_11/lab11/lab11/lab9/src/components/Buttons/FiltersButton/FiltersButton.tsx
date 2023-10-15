import IButton from "../IButton";
import './filtresButton.scss'

const FiltersButton = ({ context, command}: IButton) => {
    return (
        <button onClick={() => command() }
                className="filterButton">
            { context }
        </button>
        )
}

export default FiltersButton;