<template>
        <div class="col-lg-10">
            <strong>Ваш заказ №{{orderId}} находится в режиме ожидания оплаты.</strong>
            <p>Если вы произвели оплату нажмите на кнопку чтобы проверить статус.</p>
            <a @click.prevent="checkStatus" class="stsBtn">Проверить статус оплаты</a>
            <p class="stsText">Статус: <span>{{paymentStatus}}</span></p>
        </div>
</template>

<script>
import axios from "axios";

export default {
    props: ['orderId','paymentId'],
    data() {
        return {
            paymentStatus: '',
            paymentStatusId: '',
        }
    },
    created() {
        this.checkStatus();
    },
    methods: {
        checkStatus() {
            axios.get(`/checkout/${this.orderId}/${this.paymentId}/checkPaymentStatus`)
                .then((response) => {
                    this.paymentStatus = response.data.paymentStatus;
                    this.paymentStatusId = response.data.paymentStatusId;
                });
        }
    },
};
</script>
<style>
.stsBtn {
    padding: 20px 40px;
    border-radius: 100px;
    font-size: 16px;
    background: #FABB00;
    color: #000;
    text-decoration: none;
    transition: 0.3s;
    cursor: pointer;
    margin-bottom: 20px;
    display: inline-block;
}
.stsBtn:hover {
    background: #FFD561;
    color: #000;
    transition: 0.3s;
}
.stsText span {
    font-style: italic;
}
</style>
