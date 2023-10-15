import IButton from "./IButton";
import '../../assets/styles/searchbutton.scss';

const SearchButton = ({ context, command } : IButton) => {
    return (
        <button onClick={() => command()}
                className="searchButton">
            { context }
        </button>
        )
}

export default SearchButton;