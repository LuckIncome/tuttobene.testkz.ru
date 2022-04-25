<template>
    <keep-alive>
        <span :count="count">{{ cartCount }}</span>
    </keep-alive>
</template>

<script>
import {store} from '../app';

export default {
    props: ['count'],
    data() {
        return {
            pageCreated: false,
        }
    },
    computed: {
        cartCount() {
            return this.$store.state.cartCount;
        }
    },
    created() {
        setTimeout(()=>{this.pageCreated = true;},1000);
    },
    updated() {
        if (this.pageCreated){
            let cart = document.querySelector('.head_cart') // Using a class instead, see note below.
            let myInterval = setInterval(() => {
                cart.classList.toggle('hover');
            }, 100);
            setTimeout(() => {
                clearInterval(myInterval);
                cart.classList.remove('hover');
            }, 500)
        }
    },
    mounted() {
        store.state.cartCount = this.count;
    },
    methods: {},
};
</script>
