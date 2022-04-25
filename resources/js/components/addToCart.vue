<template>
    <a :class="btnClass" :portionId="portionId" :productType="productType" :productId="productId" @click="addToCart" href="#"></a>
</template>

<script>

export default {
    props: ['btnClass', 'productId','productType', 'portionId'],
    methods: {
        addToCart() {
            let self = this;
            axios.post('/cart/add',{productId: this.productId, productType: this.productType, portionId:this.portionId, qty:1})
                .then((response)=>{
                    self.btnClass = 'added';
                    self.$store.commit('updateCartCount',response.data.count);
                    self.$store.commit('updateCartTotal',response.data.total);
                    self.$store.commit('updateCartItems',response.data.items);
            });
        }

    },
};
</script>
