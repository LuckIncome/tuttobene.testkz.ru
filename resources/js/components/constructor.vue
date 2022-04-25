<template>
    <div
        :price="price"
        :minWeight1="minWeight1"
        :minWeight2="minWeight2"
        :minWeight3="minWeight3"
        :maxWeight="maxWeight"
    >
        <div class="row tort_vkus">
            <div class="col-12 zag_team">
                <span>Вкус, форма</span>
                <hr>
            </div>
            <div class="col-lg-4">
                <div class="yarys yarus_first">
                    <div class="yarys_zag">
                        Количество ярусов
                    </div>
                    <div class="yarys_text">
                        <div>
                            <input type="radio" id="one_yarus" @change="calculate('stage')" v-model="cake.stage"
                                   name="yarus" value="1" checked>
                            <label for="one_yarus">
                                <picture>
                                    <img src="/img/ya_1.svg" alt="">
                                </picture>
                                Один ярус
                            </label>
                        </div>
                        <div>
                            <input type="radio" id="two_yarus" @change="calculate('stage')" v-model="cake.stage"
                                   name="yarus" value="2">
                            <label for="two_yarus">
                                <picture>
                                    <img src="/img/ya_2.svg" alt="">
                                </picture>
                                Два яруса
                            </label>
                        </div>
                        <div>
                            <input type="radio" id="three_yarus" @change="calculate('stage')" v-model="cake.stage"
                                   name="yarus" value="3">
                            <label for="three_yarus">
                                <picture>
                                    <img src="/img/ya_3.svg" alt="">
                                </picture>
                                Три яруса
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="yarys">
                    <div class="yarys_zag">
                        Выберите форму
                    </div>
                    <div class="yarys_text">
                        <div>
                            <input type="radio" id="krug" name="tort_forma" v-model="cake.shape" value="circle" checked>
                            <label for="krug">
                                <picture>
                                    <img src="/img/krug.svg" alt="">
                                </picture>
                                Круг
                            </label>
                        </div>
                        <div>
                            <input type="radio" id="kvadrat" v-model="cake.shape" name="tort_forma" value="square">
                            <label for="kvadrat">
                                <picture>
                                    <img src="/img/kvadrat.svg" alt="">
                                </picture>
                                Квадрат
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" v-model="cake.biscuit"
                               id="flexSwitchCheckChecked" checked>
                        <label class="form-check-label" for="flexSwitchCheckChecked">Включить бисквит?</label>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="yarys yarys_vkus">
                    <div class="yarys_zag">
                        Выберите вкус
                    </div>
                    <div class="yarys_text">
                        <ul>
                            <li v-for="taste in tastes" :key="taste.id">
                                <input
                                    type="checkbox"
                                    name="vkus"
                                    v-model="cake.tastes"
                                    :value="taste.id"
                                    :id="`vkys_${taste.id}`"
                                    :disabled="cake.tastes.length == cake.stage && cake.tastes.indexOf(taste.id) === -1"
                                ><label :for="`vkys_${taste.id}`">{{ taste.title }}</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row tort_oformlenie">
            <div class="col-12 zag_team">
                <span>Оформление</span>
                <hr>
            </div>
            <div class="col-lg-4">
                <b>Надпись на торте</b>
                <input type="text" name="nadpis" v-model="cake.text" placeholder="Введите текст">
                <span>Если не хотите надписи, оставьте поле пустым</span>
            </div>
            <div class="col-lg-5">
                <b>Общее пожелание по оформлению</b>
                <textarea name="pozhelaniya" v-model="cake.comments" placeholder="Введите текст"></textarea>
            </div>
            <div class="col-lg-3">
                <div class="clearfix"></div>
                <p>Ваши пожелания будут учтены при создании торта. Для уточнения деталей с Вами свяжется наш
                    менеджер.</p>
                <p>Использование для оформления мастики, к сожалению, невозможно.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 zag_team">
                <span>Детали заказа</span>
                <hr>
            </div>
            <div class="col-lg-9">
                <div class="container-fluid options_block">
                    <div class="row cart_options align-items-center justify-content-center justify-content-xl-start">
                        <div class="col-xl-3 detali_1 detali_2 text-xl-start text-center">
                            1 кг
                            <b>{{ formatPrice(cake.price) }} тг</b>
                        </div>
                        <div class="col-xl-2 text-xl-end text-center">
                            Вес торта
                        </div>
                        <div class="col-xl-4 detali_1 detali_2 text-xl-start text-center">
                            <select v-model="cake.weightKg" @change="calculate">
                                <option :value="kilo" v-for="kilo in cake.kilogramms">{{ kilo }} кг</option>
                            </select>
                            /
                            <select v-model="cake.weightGr" @change="calculate">
                                <option :value="i" v-for="i in cake.gramms">{{ i }} гр</option>
                            </select>
                        </div>
                        <div class="col-xl-1 detali_1 text-xl-start text-center">
                            Кол-во
                        </div>
                        <div class="col-xl-2 text-center detali_1 detali_2">
                            <div class="tovar_inner_2">
                                <button type="button" @click="minusCart">-</button>
                                <input type="number" min="1" max="100" :value="cake.quantity" readonly class="raz">
                                <button type="button" @click="plusCart">+</button>
                            </div>
                        </div>
                        <div class="row cart_options align-items-center justify-content-center justify-content-xl-start"
                             v-if="cake.productTotal">
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
                                            <option v-for="branch in branches" :value="branch.id" :key="branch.id">
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
                                        <a href="#" data-bs-toggle="modal" data-bs-target="#dostavkaa">Условия
                                            доставки</a>
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
                                       :class="{'error': $v.client.name.$error}" name="name" placeholder="Имя *"
                                       required>
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
                                           :class="{'error': $v.company.iik.$error}" name="company[iik]"
                                           placeholder="ИИК *"
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
                            <b>{{ formatPrice(cake.productTotal) }} тг.</b>
                        </div>
                        <div class="col-4 itogo_1">
                            Доставка
                        </div>
                        <div class="col-8 text-end itogo_1">
                            <b>{{ client.deliveryType === 'self' ? 'Самовывоз' : (client.deliveryPrice > 0) ? client.deliveryPrice + ' тг.' : 'Бесплатно' }}</b>
                        </div>
                        <hr>
                        <div class="col-4 itogo_1">
                            К оплате
                        </div>
                        <div class="col-8 text-end itogo_1">
                            <span>{{ formatPrice(cake.productTotal + client.deliveryPrice) }} тг.</span>
                        </div>
                        <div v-if="cake.productTotal" class="col-12 text-center itogo_2">
                            <a href="#" @click.prevent="checkoutCart">Оформить заказ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import {minLength, required} from "vuelidate/lib/validators";
import axios from "axios";

export default {
    props: ['price', 'minWeight1', 'minWeight2', 'minWeight3', 'maxWeight'],
    data() {
        return {
            minimumWeight: 0,
            cake: {
                stage: 1,
                shape: 'circle',
                tastes: [],
                biscuit: false,
                text: '',
                comments: '',
                weight: 0,
                quantity: 1,
                price: this.price,
                productTotal: this.price * parseFloat(this.minWeight1),
                weightKg: parseInt(this.minWeight1),
                weightGr: (parseFloat(this.minWeight1) * 1000) - (parseInt(this.minWeight1) * 1000),
                gramms: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900],
                kilogramms: this.maxWeight.length > 0 ? parseInt(this.maxWeight) : 10,
            },
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
            tastes: [],
        }
    },
    created() {
        this.calculate();
        this.minimumWeight = this.setMinWeight();
        this.getContent();
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
    methods: {
        getContent() {
            axios.get('/constructor/getAddons')
                .then((response) => {
                    this.branches = response.data.branches;
                    this.districts = response.data.districts;
                    this.tastes = response.data.tastes;
                });
        },
        minusCart() {
            if (this.cake.quantity > 1)
                this.cake.quantity--;
            this.calculate();
        },
        plusCart() {
            this.cake.quantity++;
            this.calculate();
        },
        selectTastes(){
            console.log(this.cake.tastes)
            if (this.cake.tastes.length >= this.cake.stage){
                this.cake.tastes.length = this.cake.stage;
            }
        },
        calculate(type) {
            this.minimumWeight = this.setMinWeight();

            let totalWeight = parseFloat((this.cake.weightKg * 1000 + this.cake.weightGr) / 1000);
            let totalGramms = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900];
            let maxWeight = parseFloat(this.maxWeight) > 0 ? parseFloat(this.maxWeight) : 10;

            if (parseInt(totalWeight) === parseInt(maxWeight)) {
                this.cake.gramms = totalGramms.filter((gram) => {
                    return gram <= (maxWeight * 1000) - (parseInt(maxWeight) * 1000)
                });
            } else if (parseInt(totalWeight) === parseInt(this.minimumWeight)) {
                this.cake.gramms = totalGramms.filter((gram) => {
                    return gram >= (parseFloat(this.minimumWeight) * 1000) - (parseInt(this.minimumWeight) * 1000)
                });
            } else {
                this.cake.gramms = totalGramms;
            }
            if (type == 'stage') {
                this.setWeight(totalWeight, maxWeight);
                this.cake.tastes = [];
            } else {
                if (totalWeight >= parseFloat(this.minimumWeight) && totalWeight <= maxWeight) {
                    this.cake.productTotal = this.cake.quantity * (totalWeight * this.cake.price);
                } else {

                    alert(`Минимальный вес торта - ${this.minimumWeight} кг;\nМаксимальный вес торта - ${maxWeight} кг;`);

                    this.setWeight(totalWeight, maxWeight);

                }
            }
        },
        setWeight(totalWeight, maxWeight) {
            if (parseInt(totalWeight) <= parseInt(this.minimumWeight)) {
                this.cake.productTotal = this.cake.quantity * (parseFloat(this.minimumWeight) * this.cake.price);
                this.cake.weightKg = parseInt(this.minimumWeight);
                this.cake.weightGr = (parseFloat(this.minimumWeight) * 1000) - (parseInt(this.minimumWeight) * 1000);
            } else if (parseInt(totalWeight) >= parseInt(this.maxWeight)) {
                this.cake.productTotal = this.cake.quantity * (parseFloat(maxWeight) * this.cake.price);
                this.cake.weightKg = parseInt(maxWeight);
                this.cake.weightGr = (maxWeight * 1000) - (parseInt(maxWeight) * 1000);
            }
        },
        setMinWeight() {
            if (this.cake.stage == 1) {
                return parseFloat(this.minWeight1);
            } else if (this.cake.stage == 2) {
                return parseFloat(this.minWeight2);
            } else {
                return parseFloat(this.minWeight3);
            }
        },
        formatPrice(value) {
            let val = (value / 1).toFixed(0).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
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
            if (currentDistrict.amount > 0 && this.cake.productTotal >= currentDistrict.amount){
                this.client.deliveryPrice = 0;
            }else {
                this.client.deliveryPrice = currentDistrict.price;
            }
        },
        checkoutCart() {
            this.$v.$touch();
            if (this.$v.$invalid) {
                this.formStatus = false;
            } else {
                let self = this;
                let totalWeight = parseFloat(this.cake.weightKg + (this.cake.weightGr / 1000));
                this.cake.weight = totalWeight;

                axios.post('/constructor/confirm', {
                    client: this.client,
                    company: this.company,
                    cake: this.cake,
                }).then((response) => {
                    if (!response.data.success) {
                        this.formStatus = false;
                    } else {
                        window.location = response.data.link;
                    }
                });
            }

        },
    },
    watch: {
        'cake.productTotal': {
            immediate: true,
            handler(newVal, oldVal) {
                this.changeDeliveryType();
            },
        },
    },
};
</script>
