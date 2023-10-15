import ITag from "../ITag";
import "../../../assets/styles/tag.scss"

function LanTag({ text, onClick }: ITag) {

    onClick ??= () => { };

    return (
        <div onClick={() => onClick()} className="tag">
            {text ?? ""}
        </div>
    );
}

export default LanTag;