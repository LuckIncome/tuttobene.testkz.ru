<template>
    <div :productId="productId" class="row justify-content-between align-items-center tovar_inner_add_block">
        <div class="col-8 col-md-6 col-xl-4 d-flex align-items-center">
            <div class="flex-shrink-0">
                <picture>
                    <img :src="icon" alt="">
                </picture>
            </div>
            <div class="flex-grow-1 ms-3">
                <b>{{title}}</b><br>
                {{excerpt}}
            </div>
        </div>
        <div class="col-4 col-md-6 col-xl-auto text-center tovar_cena">
            {{ price }} тг
        </div>
        <div class="col-6 col-xl-3 text-center">
            <div class="tovar_inner_2 white_colvo">
                <button type="button"  @click="minusCart">-</button>
                <input type="number" min="1" max="100" :value="count" readonly class="raz">
                <button type="button" @click="plusCart">+</button>
            </div>
        </div>
        <div class="col-4 col-md-6 col-xl-2 text-center text-xl-end">
            <a href="#" @click="addToCart" class="add_cart"></a>
        </div>
    </div>
</template>

<script>

export default {
    props: ['productId','icon','title','excerpt','price','productType','portionId'],
    data() {
        return {
            count: 1,
        };
    },
    methods: {
        minusCart() {
            if (this.count > 0)
                this.count--;
        },
        plusCart() {
            this.count++;
        },
        addToCart() {
            let self = this;
            axios.post('/cart/add',{productId: this.productId, productType: this.productType, portionId:this.portionId, qty:this.count})
                .then((response)=>{
                    self.$store.commit('updateCartCount',response.data.count);
                    self.$store.commit('updateCartTotal',response.data.total);
                    self.$store.commit('updateCartItems',response.data.items);
                });
        }
    },
};
</script>
