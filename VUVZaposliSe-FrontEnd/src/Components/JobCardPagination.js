import React, { useState } from "react";
import SweetPagination from "sweetpagination";

function JobCardPagination({ items }) {
  const [currentPageData, setCurrentPageData] = useState(new Array(2).fill());
  return (
    <div>
      <SweetPagination
        currentPageData={setCurrentPageData}
        dataPerPage={9}
        getData={items}
        navigation={true}
      />
    </div>
  );
}
export default JobCardPagination;
