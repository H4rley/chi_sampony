function renderTab(tab) {
    document.getElementById('cardItems').style.display = 'none';
    document.getElementById('transport').style.display = 'none';
    document.getElementById('payment').style.display = 'none';
    document.getElementById('address').style.display = 'none';
    document.getElementById('summary').style.display = 'none';

    document.getElementById('liCardItems').classList.remove('active');
    document.getElementById('liPayment').classList.remove('active');
    document.getElementById('liTransport').classList.remove('active');
    document.getElementById('liAddress').classList.remove('active');
    document.getElementById('liSummary').classList.remove('active');

    document.getElementById(tab).style.display = 'block';
    document.getElementById('li' + tab.charAt(0).toUpperCase() + tab.slice(1)).classList.add('active');
}

