<template>
    <keep-alive>
        <div class="row">
            <div class="col-lg-9">
                <div class="container-fluid options_block">
                    <p v-if="!total">Ваша корзина пуста.</p>
                    <cart-item v-else v-for="item in items" :key="item.id" :item="item"></cart-item>
                    <div v-if="total" class="row cart_options align-items-center justify-content-center">
                        <div class="col-12 cart_zag">
                            Способ получения
                        </div>
                        <div class="col-sm-6">
                            <input type="radio" name="poluchenie" id="samovyvoz" v-model="client.deliveryType"
                                   @change="changeDeliveryType"
                                   value="self">
                            <label for="samovyvoz" class="sposob">Самовывоз</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="radio" name="poluchenie" id="dostavka" v-model="client.deliveryType"
                                   @change="changeDeliveryType"
                                   value="delivery">
                            <label for="dostavka" class="sposob">Доставка курьером</label>
                        </div>
                        <figure id="w_1" class="vis1" v-if="client.deliveryType === 'self'">
                            <div class="row align-items-center">
                                <div class="col-xl-3 text-center text-xl-start samovyvoz_options">
                                    <span>Выберите пункт выдачи</span>
                                </div>
                                <div class="col-xl-9 samovyvoz_options">
                                    <select name="selfAddress" v-model="client.branch">
                                        <option v-for="(branch, key) in branches" :value="branch.id" :key="branch.id">
                                            {{ branch.full_title }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </figure>
                        <figure id="w_2" class="vis1" v-else>
                            <div class="row align-items-center">
                                <figure id="w_3" class="vis1">
                                    <div class="row align-items-center">
                                        <div class="col-xl-3 text-center text-xl-start samovyvoz_options">
                                            <span>Выберите район доставки</span>
                                        </div>
                                        <div class="col-xl-9 samovyvoz_options">
                                            <select name="selfAddress" v-model="client.district"
                                                    @change="changeDistrict">
                                                <option v-for="district in districts" :value="district.id"
                                                        :key="district.id">
                                                    {{ district.title }}
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </figure>
                                <div class="col-xl-3 text-center text-xl-start samovyvoz_options_2">
                                    <span>Введите адрес доставки</span>
                                    <p>Доставка осуществляется только по г.Алматы</p>
                                </div>
                                <div class="col-xl-6 samovyvoz_options_2">
                                    <input type="text" name="address" v-model="client.address"
                                           placeholder="Город, улица, дом, номер строения, квартира">
                                </div>
                                <div class="col-xl-3 text-center samovyvoz_options_2">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#dostavkaa">Условия доставки</a>
                                </div>
                                <div class="col-12 cart_zag_2 samovyvoz_options_2">
                                    Дата и время доставки
                                </div>
                                <div class="col-md-6 col-xl-3 samovyvoz_options_2">
                                    <input type="date" v-model="client.date" class="dost_date">
                                </div>
                                <div class="col-md-6 col-xl-3 samovyvoz_options_2">
                                    <select v-model="client.time">
                                        <option value="11:00 — 12:00">11:00 — 12:00</option>
                                        <option value="12:00 — 13:00">12:00 — 13:00</option>
                                        <option value="13:00 — 14:00">13:00 — 14:00</option>
                                        <option value="14:00 — 15:00">14:00 — 15:00</option>
                                        <option value="15:00 — 16:00">15:00 — 16:00</option>
                                        <option value="16:00 — 17:00">16:00 — 17:00</option>
                                        <option value="17:00 — 18:00">17:00 — 18:00</option>
                                    </select>
                                </div>
                                <div class="col-xl-6 text-center text-xl-start samovyvoz_options_2">
                                    Время доставки: с 11 до 18 <b>ежедневно</b>
                                </div>
                            </div>
                        </figure>
                        <div class="col-12 cart_zag_3">
                            Получатель
                        </div>
                        <div class="col-md-6 samovyvoz_options_3">
                            <input type="text" v-model="$v.client.name.$model"
                                   :class="{'error': $v.client.name.$error}" name="name" placeholder="Имя *" required>
                        </div>
                        <div class="col-md-6 samovyvoz_options_3">
                            <input type="tel" name="phone" v-mask="'+7 (###) ###-##-##'" v-model="$v.client.phone.$model"
                                   :class="{'error': $v.client.phone.$error}" class="phonee"
                                   placeholder="+7 (___) __ - __ - ___" required>
                        </div>
                        <div class="col-12 cart_zag_3">
                            Способ оплаты
                        </div>
                        <div class="col-10 col-md-6 col-xl-4">
                            <input type="radio" name="oplata" id="oplata_carta" v-model="client.paymentType"
                                   value="card">
                            <label for="oplata_carta" class="sposob_2">Картой Visa / MasterCard</label>
                        </div>
                        <div class="col-10 col-md-6 col-xl-4" v-if="!hasCake">
                            <input type="radio" name="oplata" id="oplata_kureer" v-model="client.paymentType"
                                   value="cash">
                            <label for="oplata_kureer" class="sposob_2">Наличными курьеру</label>
                        </div>
                        <div class="col-10 col-md-6 col-xl-4">
                            <input type="radio" name="oplata" id="oplata_schet" v-model="client.paymentType"
                                   value="charge">
                            <label for="oplata_schet" class="sposob_2">По счету на оплату</label>
                        </div>
                        <div v-if="client.paymentType === 'charge'" class="company-fields row">
                            <div class="col-12 cart_zag_3">
                                Юридические данные
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" v-model="$v.company.name.$model"
                                       :class="{'error': $v.company.name.$error}" name="company[name]"
                                       placeholder="Название компании *"
                                       required>
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" name="company[bin]" v-model="$v.company.bin.$model"
                                       :class="{'error': $v.company.bin.$error}" class=""
                                       placeholder="БИН *" required>
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" v-model="$v.company.iik.$model"
                                       :class="{'error': $v.company.iik.$error}" name="company[iik]" placeholder="ИИК *"
                                       required>
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" name="company[bik]" v-model="$v.company.bik.$model"
                                       :class="{'error': $v.company.bik.$error}" class=""
                                       placeholder="БИК *" required>
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" v-model="company.person"
                                       name="company[person]" placeholder="Уполномоченное лицо">
                            </div>
                            <div class="col-md-6 samovyvoz_options_3">
                                <input type="text" name="company[address]" v-model="$v.company.address.$model"
                                       :class="{'error': $v.company.address.$error}" class=""
                                       placeholder="Юридический адрес *" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="itogo_block sticky-lg-top">
                    <div class="row align-items-center">
                        <div class="col-12 itogo_1">
                            <h3>Ваш заказ</h3>
                        </div>
                        <div class="col-4 itogo_1">
                            Товары
                        </div>
                        <div class="col-8 text-end itogo_1">
                            <b>{{ formatPrice(total) }} тг.</b>
                        </div>
                        <div class="col-4 itogo_1">
                            Доставка
                        </div>
                        <div class="col-8 text-end itogo_1">
                            <b>{{
                                    client.deliveryType === 'self' ? 'Самовывоз' : (client.deliveryPrice > 0) ? client.deliveryPrice + ' тг.' : 'Бесплатно'
                                }}</b>
                        </div>
                        <hr>
                        <div class="col-4 itogo_1">
                            К оплате
                        </div>
                        <div class="col-8 text-end itogo_1">
                            <span>{{ formatPrice(total + client.deliveryPrice) }} тг.</span>
                        </div>
                        <div v-if="total" class="col-12 text-center itogo_2">
                            <a href="#" @click.prevent="checkoutCart">Оформить заказ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </keep-alive>
</template>

<script>

import axios from "axios";
import {required, minLength} from 'vuelidate/lib/validators';

export default {
    data() {
        return {
            client: {
                deliveryType: 'self',
                branch: 2,
                district: 9,
                time: '11:00 — 12:00',
                paymentType: 'card',
                deliveryPrice: 0,
                name: '',
                phone: '',
            },
            company: {
                name: '',
                bin: '',
                bik: '',
                iik: '',
                person: '',
                address: '',
            },
            formStatus: true,
            branches: [],
            districts: [],
        };
    },
    created() {
        this.getCartContent();
        $(".phonee").mask("+7 (999) 999 - 99 - 99");
    },
    validations() {
        if (this.client.paymentType === 'charge') {
            return {
                client: {
                    name: {
                        required,
                        minLength: minLength(3)
                    },
                    phone: {
                        required
                    }
                },
                company: {
                    name: {
                        required,
                        minLength: minLength(3)
                    },
                    bin: {
                        required
                    },
                    iik: {
                        required
                    },
                    bik: {
                        required
                    },
                    address: {
                        required
                    }
                }
            }
        } else {
            return {
                client: {
                    name: {
                        required,
                        minLength: minLength(3)
                    },
                    phone: {
                        required
                    }
                }
            }
        }

    },
    computed: {
        total: {
            get() {
                return this.$store.state.total;
            },
            set(val) {
                this.$store.state.total = val;
            },
        },
        items: {
            get() {
                return this.$store.state.items;
            },
            set(val) {
                this.$store.state.items = val;
            },
        },
        hasCake: {
            get() {
                return this.$store.state.hasCake;
            }
        }
    },
    mounted() {
        this.$store.state.total = this.total;
        this.$store.state.items = this.items;
        this.$store.state.hasCake = this.hasCake;
    },
    methods: {
        getCartContent() {
            this.$store.dispatch("getCartContent");
            axios.get('/cart/getCartAddons')
                .then((response) => {
                    this.branches = response.data.branches;
                    this.districts = response.data.districts;
                });
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
        },
        removeItem(item) {
            this.items.splice(this.items.indexOf(item), 1);
        },
        changeDeliveryType() {
            if (this.client.deliveryType === 'self') {
                this.client.deliveryPrice = 0;
            } else {
                this.changeDistrict();
            }
        },
        changeDistrict() {
            let currentDistrict = this.districts.find((dist) => dist.id === this.client.district);
            if (currentDistrict.amount > 0 && this.total >= currentDistrict.amount) {
                this.client.deliveryPrice = 0;
            } else {
                this.client.deliveryPrice = currentDistrict.price;
            }
        },
        checkoutCart() {
            this.$v.$touch();
            if (this.$v.$invalid) {
                this.formStatus = false;
            } else {
                axios.post('/checkout/confirm', {
                    client: this.client,
                    company: this.company
                }).then((response) => {
                    if (!response.data.success) {
                        this.formStatus = false;
                    } else {
                        window.location = response.data.link;
                    }
                });
            }

        }
    },
    watch: {
        total: {
            immediate: true,
            handler(newVal, oldVal) {
                this.changeDeliveryType();
            },
        },
    },
};
</script>

<style>
input.error {
    border-color: red;
}

.company-fields .samovyvoz_options_3, .company-fields .samovyvoz_options_2 {
    margin: 10px 0;
}
</style>
