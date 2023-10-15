import { Link } from "react-router-dom";
import IMenuLink from "./IMenuLink";
import "./MenuLink.scss";
import { useRef } from "react";

const MenuLink = ({ text, href, active, onClick } : IMenuLink) => {
    return (
        <Link to={ href || "#" }
              className="point-menu"
              onClick={ onClick }
              >

            <span className={ active? "point-menu-text active" : "point-menu-text" }>
                { text ?? "" }
            </span>

        </Link>
        )

}

export default MenuLink;