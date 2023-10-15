import IButton from "./IButton";
import '../../assets/styles/filterbutton.scss';

const SearchButton = ({ context, command } : IButton) => {
    return (
        <button onClick={() => command()}
                className="filterButton">
            { context }
        </button>
        )
}

export default SearchButton;