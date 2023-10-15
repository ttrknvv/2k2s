import axios from "axios"

const getDatas = async <T>(path : string) => {
    const datas = await axios.get(`/datas/${path}`);
    const obj = datas.data as T[];
    return obj;
}

export default getDatas;