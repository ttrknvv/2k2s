import IFilter from "./IFilter";

export default interface IFilterCatalog {
    filters : IFilter[];
    dispatch ?: any;
}