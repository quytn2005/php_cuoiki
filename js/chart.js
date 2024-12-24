//Gửi yêu cầu tới ajax/chart.php để lấy dữ liệu biểu đồ từ server.
function fetchChart() {
    $.ajax({
        url:"ajax/chart.php",
        method: "POST",
        data: {
            action: 'fetchChart',
        },
        success: function (data) {
            const fetchData = JSON.parse(data);//chuyển json thành đối tượng javascript
            const dataBill = fetchData.bill// dữ liệu hóa đơn
            const dataProduct = fetchData.product// dữ liệu sản phảm bán chạy
            const dataCategory = fetchData.category// dữ liệu danh mục bán chạy
            console.log(dataCategory)
            const ctx = document.getElementById('myChart');
            const barChart1 = document.getElementById('bar-chart1');
            const barChart2 = document.getElementById('bar-chart2');




            //biểu đồ thoóng kê ngày
            new Chart(ctx, {
            type: 'line',
            data: {
              labels: dataBill.map((item) => item.ngay),
              datasets: [{
                label: 'SỐ ĐƠN ĐẶT HÀNG',
                data: dataBill.map((item) => item.soluong),
                borderWidth: 1,
                fill: {
                    target: 'origin',
                    above: '#ddeefa',  
                },
                pointStyle: 'circle',
                pointRadius: 10,
                pointHoverRadius: 15,
              }]
            },
            options: {
                plugins: {
                    title: {
                    display: true,
                    text: 'THỐNG KÊ SỐ LƯỢNG ĐƠN HÀNG THEO NGÀY'
                    },
                },
                scales: {
                    y: {
                    beginAtZero: true
                    }
                }
            }       
        });
//biểu đồ top 5 san rphamr bán chạyh
        new Chart(barChart1, {
            type: 'pie',
            data: {
              labels: dataProduct.map((item) => item.title_product),
              datasets: [{
                label: 'SỐ LƯỢNG BÁN RA',
                data: dataProduct.map((item) => item.sold),
              }]
            },
            options: {
                plugins: {
                    title: {
                    display: true,
                    text: 'TOP 5 SẢN PHẨM BÁN CHẠY NHẤT'
                    },
                },
                scales: {
                    
                }
            }       
        });
// biểu đồ top 5 danh mục bán chạy
        new Chart(barChart2, {
            type: 'doughnut',
            data: {
              labels: dataCategory.map((item) => item.name_category),
              datasets: [{
                label: 'SỐ LƯỢNG BÁN RA',
                data: dataCategory.map((item) => item.sold),
              }]
            },
            options: {
                plugins: {
                    title: {
                    display: true,
                    text: 'TOP 5 DANH MỤC SẢN PHẨM BÁN CHẠY'
                    },
                },
                scales: {
                    
                }
            }       
        });
        
        }
    })

}
fetchChart();