export default interface ILink {
    text?: string;
    href?: string;
    onClick?: React.MouseEventHandler<HTMLAnchorElement> | undefined;
}