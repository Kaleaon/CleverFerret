.class public Lcom/github/junrar/unpack/ppm/ModelPPM;
.super Ljava/lang/Object;
.source "ModelPPM.java"


# static fields
.field public static final BIN_SCALE:I = 0x4000

.field public static final INTERVAL:I = 0x80

.field public static final INT_BITS:I = 0x7

.field private static InitBinEsc:[I = null

.field public static final MAX_FREQ:I = 0x7c

.field public static final MAX_O:I = 0x40

.field public static final PERIOD_BITS:I = 0x7

.field public static final TOT_BITS:I = 0xe


# instance fields
.field private HB2Flag:[I

.field private NS2BSIndx:[I

.field private NS2Indx:[I

.field private SEE2Cont:[[Lcom/github/junrar/unpack/ppm/SEE2Context;

.field private binSumm:[[I

.field private charMask:[I

.field private coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

.field private dummySEE2Cont:Lcom/github/junrar/unpack/ppm/SEE2Context;

.field private escCount:I

.field private foundState:Lcom/github/junrar/unpack/ppm/State;

.field private hiBitsFlag:I

.field private initEsc:I

.field private initRL:I

.field private maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private maxOrder:I

.field private minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private numMasked:I

.field private orderFall:I

.field private prevSuccess:I

.field private final ps:[I

.field private runLength:I

.field private subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

.field private final tempPPMContext1:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private final tempPPMContext2:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private final tempPPMContext3:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private final tempPPMContext4:Lcom/github/junrar/unpack/ppm/PPMContext;

.field private final tempState1:Lcom/github/junrar/unpack/ppm/State;

.field private final tempState2:Lcom/github/junrar/unpack/ppm/State;

.field private final tempState3:Lcom/github/junrar/unpack/ppm/State;

.field private final tempState4:Lcom/github/junrar/unpack/ppm/State;

.field private final tempStateRef1:Lcom/github/junrar/unpack/ppm/StateRef;

.field private final tempStateRef2:Lcom/github/junrar/unpack/ppm/StateRef;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    .line 75
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/github/junrar/unpack/ppm/ModelPPM;->InitBinEsc:[I

    return-void

    :array_0
    .array-data 4
        0x3cdd
        0x1f3f
        0x59bf
        0x48f3
        0x64a1
        0x5abc
        0x6632
        0x6051
    .end array-data
.end method

.method public constructor <init>()V
    .locals 5

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 48
    new-array v1, v0, [I

    const/4 v2, 0x1

    const/16 v3, 0x10

    aput v3, v1, v2

    const/4 v3, 0x0

    const/16 v4, 0x19

    aput v4, v1, v3

    const-class v4, Lcom/github/junrar/unpack/ppm/SEE2Context;

    invoke-static {v4, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Lcom/github/junrar/unpack/ppm/SEE2Context;

    iput-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->SEE2Cont:[[Lcom/github/junrar/unpack/ppm/SEE2Context;

    const/16 v1, 0x100

    .line 58
    new-array v4, v1, [I

    iput-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->charMask:[I

    .line 60
    new-array v4, v1, [I

    iput-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2Indx:[I

    .line 62
    new-array v4, v1, [I

    iput-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2BSIndx:[I

    .line 64
    new-array v1, v1, [I

    iput-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->HB2Flag:[I

    .line 69
    new-array v0, v0, [I

    const/16 v1, 0x40

    aput v1, v0, v2

    const/16 v2, 0x80

    aput v2, v0, v3

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->binSumm:[[I

    .line 71
    new-instance v0, Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-direct {v0}, Lcom/github/junrar/unpack/ppm/RangeCoder;-><init>()V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    .line 73
    new-instance v0, Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-direct {v0}, Lcom/github/junrar/unpack/ppm/SubAllocator;-><init>()V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    .line 78
    new-instance v0, Lcom/github/junrar/unpack/ppm/State;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState1:Lcom/github/junrar/unpack/ppm/State;

    .line 79
    new-instance v0, Lcom/github/junrar/unpack/ppm/State;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState2:Lcom/github/junrar/unpack/ppm/State;

    .line 80
    new-instance v0, Lcom/github/junrar/unpack/ppm/State;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState3:Lcom/github/junrar/unpack/ppm/State;

    .line 81
    new-instance v0, Lcom/github/junrar/unpack/ppm/State;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState4:Lcom/github/junrar/unpack/ppm/State;

    .line 82
    new-instance v0, Lcom/github/junrar/unpack/ppm/StateRef;

    invoke-direct {v0}, Lcom/github/junrar/unpack/ppm/StateRef;-><init>()V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempStateRef1:Lcom/github/junrar/unpack/ppm/StateRef;

    .line 83
    new-instance v0, Lcom/github/junrar/unpack/ppm/StateRef;

    invoke-direct {v0}, Lcom/github/junrar/unpack/ppm/StateRef;-><init>()V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempStateRef2:Lcom/github/junrar/unpack/ppm/StateRef;

    .line 84
    new-instance v0, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext1:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 85
    new-instance v0, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext2:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 86
    new-instance v0, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext3:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 87
    new-instance v0, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-direct {v0, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext4:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 88
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->ps:[I

    .line 91
    iput-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 92
    iput-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    return-void
.end method

.method private clearMask()V
    .locals 2

    const/4 v0, 0x1

    .line 175
    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    .line 176
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->charMask:[I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    return-void
.end method

.method private createSuccessors(ZLcom/github/junrar/unpack/ppm/State;)I
    .locals 9

    .line 382
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempStateRef2:Lcom/github/junrar/unpack/ppm/StateRef;

    .line 383
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState1:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/junrar/unpack/ppm/State;->init([B)Lcom/github/junrar/unpack/ppm/State;

    move-result-object v1

    .line 386
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext1:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->init([B)Lcom/github/junrar/unpack/ppm/PPMContext;

    move-result-object v2

    .line 387
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 388
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext2:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/junrar/unpack/ppm/PPMContext;->init([B)Lcom/github/junrar/unpack/ppm/PPMContext;

    move-result-object v3

    .line 389
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 392
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState2:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/github/junrar/unpack/ppm/State;->init([B)Lcom/github/junrar/unpack/ppm/State;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez p1, :cond_1

    .line 398
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->ps:[I

    iget-object v7, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v7}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v7

    aput v7, p1, v6

    .line 399
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    const/4 v7, 0x0

    :goto_1
    if-nez p1, :cond_7

    .line 405
    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result p1

    if-eqz p1, :cond_2

    .line 406
    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result p1

    invoke-virtual {v4, p1}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 407
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result p1

    invoke-virtual {v2, p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    const/4 p1, 0x0

    :goto_2
    if-nez p1, :cond_5

    .line 412
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result p1

    invoke-virtual {v2, p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 413
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result p1

    if-eq p1, v5, :cond_4

    .line 414
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result p1

    invoke-virtual {v4, p1}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 415
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p1

    iget-object p2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p2

    if-eq p1, p2, :cond_5

    .line 417
    :cond_3
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->incAddress()Lcom/github/junrar/unpack/ppm/State;

    .line 418
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p1

    iget-object p2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p2

    if-ne p1, p2, :cond_3

    goto :goto_3

    .line 421
    :cond_4
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getOneState()Lcom/github/junrar/unpack/ppm/State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result p1

    invoke-virtual {v4, p1}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 425
    :cond_5
    :goto_3
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result p1

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p2

    if-eq p1, p2, :cond_6

    .line 426
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result p1

    invoke-virtual {v2, p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    goto :goto_4

    .line 429
    :cond_6
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->ps:[I

    add-int/lit8 p2, v7, 0x1

    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v8

    aput v8, p1, v7

    .line 430
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result p1

    move v7, p2

    if-nez p1, :cond_2

    :cond_7
    :goto_4
    if-nez v7, :cond_8

    .line 434
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    return p1

    .line 436
    :cond_8
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object p1

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p2

    aget-byte p1, p1, p2

    invoke-virtual {v0, p1}, Lcom/github/junrar/unpack/ppm/StateRef;->setSymbol(I)V

    .line 439
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    add-int/2addr p1, v5

    invoke-virtual {v0, p1}, Lcom/github/junrar/unpack/ppm/StateRef;->setSuccessor(I)V

    .line 440
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result p1

    if-eq p1, v5, :cond_e

    .line 441
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    iget-object p2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result p2

    if-gt p1, p2, :cond_9

    return v6

    .line 444
    :cond_9
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result p1

    invoke-virtual {v4, p1}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 445
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p1

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result p2

    if-eq p1, p2, :cond_b

    .line 447
    :cond_a
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->incAddress()Lcom/github/junrar/unpack/ppm/State;

    .line 448
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result p1

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result p2

    if-ne p1, p2, :cond_a

    .line 450
    :cond_b
    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result p1

    sub-int/2addr p1, v5

    .line 451
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object p2

    invoke-virtual {p2}, Lcom/github/junrar/unpack/ppm/FreqData;->getSummFreq()I

    move-result p2

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v3

    sub-int/2addr p2, v3

    sub-int/2addr p2, p1

    mul-int/lit8 v3, p1, 0x2

    if-gt v3, p2, :cond_d

    mul-int/lit8 p1, p1, 0x5

    if-le p1, p2, :cond_c

    const/4 v3, 0x1

    goto :goto_5

    :cond_c
    const/4 v3, 0x0

    goto :goto_5

    :cond_d
    mul-int/lit8 p1, p2, 0x3

    add-int/2addr v3, p1

    sub-int/2addr v3, v5

    mul-int/lit8 p2, p2, 0x2

    .line 453
    div-int/2addr v3, p2

    :goto_5
    add-int/2addr v5, v3

    invoke-virtual {v0, v5}, Lcom/github/junrar/unpack/ppm/StateRef;->setFreq(I)V

    goto :goto_6

    .line 456
    :cond_e
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getOneState()Lcom/github/junrar/unpack/ppm/State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/github/junrar/unpack/ppm/StateRef;->setFreq(I)V

    .line 460
    :cond_f
    :goto_6
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->ps:[I

    add-int/lit8 v7, v7, -0x1

    aget p1, p1, v7

    invoke-virtual {v1, p1}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 461
    invoke-virtual {v2, p0, v1, v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->createChild(Lcom/github/junrar/unpack/ppm/ModelPPM;Lcom/github/junrar/unpack/ppm/State;Lcom/github/junrar/unpack/ppm/StateRef;)I

    move-result p1

    invoke-virtual {v2, p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 462
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    if-nez p1, :cond_10

    return v6

    :cond_10
    if-nez v7, :cond_f

    .line 466
    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    return p1
.end method

.method private restartModelRare()V
    .locals 9

    .line 100
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->charMask:[I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 101
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/SubAllocator;->initSubAllocator()V

    .line 102
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxOrder:I

    const/16 v2, 0xc

    if-ge v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    :goto_0
    neg-int v0, v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initRL:I

    .line 103
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/SubAllocator;->allocContext()I

    move-result v0

    .line 104
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v3, v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 105
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v3, v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 106
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setSuffix(I)V

    .line 107
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxOrder:I

    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    .line 108
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    const/16 v3, 0x100

    invoke-virtual {v0, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->setNumStats(I)V

    .line 109
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v0

    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v0, v4}, Lcom/github/junrar/unpack/ppm/FreqData;->setSummFreq(I)V

    .line 111
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    const/16 v4, 0x80

    invoke-virtual {v0, v4}, Lcom/github/junrar/unpack/ppm/SubAllocator;->allocUnits(I)I

    move-result v0

    .line 112
    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v5, v0}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 113
    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/github/junrar/unpack/ppm/FreqData;->setStats(I)V

    .line 115
    new-instance v0, Lcom/github/junrar/unpack/ppm/State;

    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeap()[B

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    .line 116
    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v5

    .line 117
    iget v6, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initRL:I

    iput v6, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->runLength:I

    .line 118
    iput v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->prevSuccess:I

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v3, :cond_1

    mul-int/lit8 v7, v6, 0x6

    add-int/2addr v7, v5

    .line 120
    invoke-virtual {v0, v7}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 121
    invoke-virtual {v0, v6}, Lcom/github/junrar/unpack/ppm/State;->setSymbol(I)V

    .line 122
    invoke-virtual {v0, v2}, Lcom/github/junrar/unpack/ppm/State;->setFreq(I)V

    .line 123
    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v4, :cond_4

    const/4 v2, 0x0

    :goto_3
    const/16 v3, 0x8

    if-ge v2, v3, :cond_3

    const/4 v3, 0x0

    :goto_4
    const/16 v5, 0x40

    if-ge v3, v5, :cond_2

    .line 129
    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->binSumm:[[I

    aget-object v5, v5, v0

    add-int v6, v2, v3

    sget-object v7, Lcom/github/junrar/unpack/ppm/ModelPPM;->InitBinEsc:[I

    aget v7, v7, v2

    add-int/lit8 v8, v0, 0x2

    div-int/2addr v7, v8

    rsub-int v7, v7, 0x4000

    aput v7, v5, v6

    add-int/lit8 v3, v3, 0x8

    goto :goto_4

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_5
    const/16 v2, 0x19

    if-ge v0, v2, :cond_6

    const/4 v2, 0x0

    :goto_6
    const/16 v3, 0x10

    if-ge v2, v3, :cond_5

    .line 135
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->SEE2Cont:[[Lcom/github/junrar/unpack/ppm/SEE2Context;

    aget-object v3, v3, v0

    aget-object v3, v3, v2

    mul-int/lit8 v4, v0, 0x5

    add-int/lit8 v4, v4, 0xa

    invoke-virtual {v3, v4}, Lcom/github/junrar/unpack/ppm/SEE2Context;->init(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_6
    return-void
.end method

.method private startModelRare(I)V
    .locals 5

    const/4 v0, 0x1

    .line 142
    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    .line 143
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxOrder:I

    .line 144
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->restartModelRare()V

    .line 146
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2BSIndx:[I

    const/4 v1, 0x0

    aput v1, p1, v1

    const/4 v2, 0x2

    .line 147
    aput v2, p1, v0

    const/4 p1, 0x0

    :goto_0
    const/16 v2, 0x9

    if-ge p1, v2, :cond_0

    .line 149
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2BSIndx:[I

    add-int/lit8 v3, p1, 0x2

    const/4 v4, 0x4

    aput v4, v2, v3

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_1
    const/16 v2, 0xf5

    if-ge p1, v2, :cond_1

    .line 152
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2BSIndx:[I

    add-int/lit8 v3, p1, 0xb

    const/4 v4, 0x6

    aput v4, v2, v3

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_2
    const/4 v2, 0x3

    if-ge p1, v2, :cond_2

    .line 155
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2Indx:[I

    aput p1, v2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_2
    move v0, p1

    const/4 v2, 0x1

    const/4 v3, 0x1

    :goto_3
    const/16 v4, 0x100

    if-ge p1, v4, :cond_4

    .line 158
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2Indx:[I

    aput v0, v4, p1

    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v0, v0, 0x1

    move v2, v3

    :cond_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_4
    const/4 p1, 0x0

    :goto_4
    const/16 v0, 0x40

    if-ge p1, v0, :cond_5

    .line 165
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->HB2Flag:[I

    aput v1, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    :cond_5
    :goto_5
    const/16 p1, 0xc0

    if-ge v1, p1, :cond_6

    .line 168
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->HB2Flag:[I

    add-int/lit8 v0, v1, 0x40

    const/16 v2, 0x8

    aput v2, p1, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 170
    :cond_6
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->dummySEE2Cont:Lcom/github/junrar/unpack/ppm/SEE2Context;

    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/github/junrar/unpack/ppm/SEE2Context;->setShift(I)V

    return-void
.end method

.method private updateModel()V
    .locals 15

    .line 477
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempStateRef1:Lcom/github/junrar/unpack/ppm/StateRef;

    .line 478
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/StateRef;->setValues(Lcom/github/junrar/unpack/ppm/State;)V

    .line 479
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState3:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/junrar/unpack/ppm/State;->init([B)Lcom/github/junrar/unpack/ppm/State;

    move-result-object v1

    .line 480
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempState4:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/junrar/unpack/ppm/State;->init([B)Lcom/github/junrar/unpack/ppm/State;

    move-result-object v2

    .line 482
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext3:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/junrar/unpack/ppm/PPMContext;->init([B)Lcom/github/junrar/unpack/ppm/PPMContext;

    move-result-object v3

    .line 483
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->tempPPMContext4:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/github/junrar/unpack/ppm/PPMContext;->init([B)Lcom/github/junrar/unpack/ppm/PPMContext;

    move-result-object v4

    .line 486
    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 487
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getFreq()I

    move-result v5

    const/16 v6, 0x1f

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-ge v5, v6, :cond_3

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v5

    if-eqz v5, :cond_3

    .line 488
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v5

    if-eq v5, v8, :cond_2

    .line 489
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 490
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result v5

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result v6

    if-eq v5, v6, :cond_1

    .line 492
    :cond_0
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->incAddress()Lcom/github/junrar/unpack/ppm/State;

    .line 493
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result v5

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 494
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v5

    add-int/lit8 v5, v5, -0x6

    invoke-virtual {v2, v5}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 495
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v5

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v6

    if-lt v5, v6, :cond_1

    .line 496
    invoke-static {v1, v2}, Lcom/github/junrar/unpack/ppm/State;->ppmdSwap(Lcom/github/junrar/unpack/ppm/State;Lcom/github/junrar/unpack/ppm/State;)V

    .line 497
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->decAddress()Lcom/github/junrar/unpack/ppm/State;

    .line 500
    :cond_1
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v2

    const/16 v5, 0x73

    if-ge v2, v5, :cond_3

    .line 501
    invoke-virtual {v1, v7}, Lcom/github/junrar/unpack/ppm/State;->incFreq(I)V

    .line 502
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v2

    invoke-virtual {v2, v7}, Lcom/github/junrar/unpack/ppm/FreqData;->incSummFreq(I)V

    goto :goto_0

    .line 505
    :cond_2
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getOneState()Lcom/github/junrar/unpack/ppm/State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 506
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v2

    const/16 v5, 0x20

    if-ge v2, v5, :cond_3

    .line 507
    invoke-virtual {v1, v8}, Lcom/github/junrar/unpack/ppm/State;->incFreq(I)V

    .line 511
    :cond_3
    :goto_0
    iget v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    if-nez v2, :cond_5

    .line 512
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-direct {p0, v8, v1}, Lcom/github/junrar/unpack/ppm/ModelPPM;->createSuccessors(ZLcom/github/junrar/unpack/ppm/State;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(I)V

    .line 513
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 514
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 515
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v0

    if-nez v0, :cond_4

    .line 516
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModelRestart()V

    :cond_4
    return-void

    .line 521
    :cond_5
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeap()[B

    move-result-object v2

    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v5

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v2, v5

    .line 522
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->incPText()V

    .line 523
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v2

    invoke-virtual {v4, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 524
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v2

    iget-object v5, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v5}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getFakeUnitsStart()I

    move-result v5

    if-lt v2, v5, :cond_6

    .line 525
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModelRestart()V

    return-void

    .line 530
    :cond_6
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result v2

    const/4 v5, 0x0

    if-eqz v2, :cond_8

    .line 531
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result v2

    iget-object v6, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v6}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v6

    if-gt v2, v6, :cond_7

    .line 532
    invoke-direct {p0, v5, v1}, Lcom/github/junrar/unpack/ppm/ModelPPM;->createSuccessors(ZLcom/github/junrar/unpack/ppm/State;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/github/junrar/unpack/ppm/StateRef;->setSuccessor(I)V

    .line 533
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result v2

    if-nez v2, :cond_7

    .line 534
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModelRestart()V

    return-void

    .line 538
    :cond_7
    iget v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    sub-int/2addr v2, v8

    iput v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    if-nez v2, :cond_9

    .line 539
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result v2

    invoke-virtual {v4, v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 540
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v2

    iget-object v6, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v6}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v6

    if-eq v2, v6, :cond_9

    .line 541
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2, v8}, Lcom/github/junrar/unpack/ppm/SubAllocator;->decPText(I)V

    goto :goto_1

    .line 545
    :cond_8
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v4}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(I)V

    .line 546
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0, v2}, Lcom/github/junrar/unpack/ppm/StateRef;->setSuccessor(Lcom/github/junrar/unpack/ppm/PPMContext;)V

    .line 550
    :cond_9
    :goto_1
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v2

    .line 551
    iget-object v6, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v6}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/junrar/unpack/ppm/FreqData;->getSummFreq()I

    move-result v6

    sub-int/2addr v6, v2

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getFreq()I

    move-result v9

    sub-int/2addr v9, v8

    sub-int/2addr v6, v9

    .line 552
    iget-object v9, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v9}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v9

    invoke-virtual {v3, v9}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 553
    :goto_2
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v9

    iget-object v10, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v10}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v10

    if-eq v9, v10, :cond_18

    .line 555
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v9

    const/4 v10, 0x3

    if-eq v9, v8, :cond_e

    and-int/lit8 v11, v9, 0x1

    if-nez v11, :cond_a

    .line 558
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v11

    iget-object v12, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    .line 559
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v13

    invoke-virtual {v13}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v13

    ushr-int/lit8 v14, v9, 0x1

    invoke-virtual {v12, v13, v14}, Lcom/github/junrar/unpack/ppm/SubAllocator;->expandUnits(II)I

    move-result v12

    .line 558
    invoke-virtual {v11, v12}, Lcom/github/junrar/unpack/ppm/FreqData;->setStats(I)V

    .line 561
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v11

    invoke-virtual {v11}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v11

    if-nez v11, :cond_a

    .line 562
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModelRestart()V

    return-void

    :cond_a
    mul-int/lit8 v11, v9, 0x2

    if-ge v11, v2, :cond_b

    const/4 v11, 0x1

    goto :goto_3

    :cond_b
    const/4 v11, 0x0

    :goto_3
    mul-int/lit8 v12, v9, 0x4

    if-gt v12, v2, :cond_c

    const/4 v12, 0x1

    goto :goto_4

    :cond_c
    const/4 v12, 0x0

    .line 572
    :goto_4
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v13

    invoke-virtual {v13}, Lcom/github/junrar/unpack/ppm/FreqData;->getSummFreq()I

    move-result v13

    mul-int/lit8 v14, v9, 0x8

    if-gt v13, v14, :cond_d

    const/4 v13, 0x1

    goto :goto_5

    :cond_d
    const/4 v13, 0x0

    :goto_5
    and-int/2addr v12, v13

    mul-int/lit8 v12, v12, 0x2

    add-int/2addr v11, v12

    .line 574
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v12

    invoke-virtual {v12, v11}, Lcom/github/junrar/unpack/ppm/FreqData;->incSummFreq(I)V

    goto :goto_8

    .line 576
    :cond_e
    iget-object v11, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v11, v8}, Lcom/github/junrar/unpack/ppm/SubAllocator;->allocUnits(I)I

    move-result v11

    invoke-virtual {v1, v11}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 577
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v11

    if-nez v11, :cond_f

    .line 578
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModelRestart()V

    return-void

    .line 581
    :cond_f
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getOneState()Lcom/github/junrar/unpack/ppm/State;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/github/junrar/unpack/ppm/State;->setValues(Lcom/github/junrar/unpack/ppm/State;)V

    .line 582
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v11

    invoke-virtual {v11, v1}, Lcom/github/junrar/unpack/ppm/FreqData;->setStats(Lcom/github/junrar/unpack/ppm/State;)V

    .line 583
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v11

    const/16 v12, 0x1e

    if-ge v11, v12, :cond_10

    .line 584
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v11

    invoke-virtual {v1, v11}, Lcom/github/junrar/unpack/ppm/State;->incFreq(I)V

    goto :goto_6

    :cond_10
    const/16 v11, 0x78

    .line 586
    invoke-virtual {v1, v11}, Lcom/github/junrar/unpack/ppm/State;->setFreq(I)V

    .line 588
    :goto_6
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v11

    .line 589
    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getFreq()I

    move-result v12

    iget v13, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initEsc:I

    add-int/2addr v12, v13

    if-le v2, v10, :cond_11

    const/4 v13, 0x1

    goto :goto_7

    :cond_11
    const/4 v13, 0x0

    :goto_7
    add-int/2addr v12, v13

    .line 588
    invoke-virtual {v11, v12}, Lcom/github/junrar/unpack/ppm/FreqData;->setSummFreq(I)V

    .line 591
    :goto_8
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getFreq()I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v12

    invoke-virtual {v12}, Lcom/github/junrar/unpack/ppm/FreqData;->getSummFreq()I

    move-result v12

    add-int/lit8 v12, v12, 0x6

    mul-int v11, v11, v12

    .line 592
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v12

    invoke-virtual {v12}, Lcom/github/junrar/unpack/ppm/FreqData;->getSummFreq()I

    move-result v12

    add-int/2addr v12, v6

    mul-int/lit8 v13, v12, 0x6

    if-ge v11, v13, :cond_14

    if-le v11, v12, :cond_12

    const/4 v13, 0x1

    goto :goto_9

    :cond_12
    const/4 v13, 0x0

    :goto_9
    add-int/2addr v13, v8

    mul-int/lit8 v12, v12, 0x4

    if-lt v11, v12, :cond_13

    const/4 v11, 0x1

    goto :goto_a

    :cond_13
    const/4 v11, 0x0

    :goto_a
    add-int/2addr v13, v11

    .line 595
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/github/junrar/unpack/ppm/FreqData;->incSummFreq(I)V

    goto :goto_e

    :cond_14
    mul-int/lit8 v10, v12, 0x9

    if-lt v11, v10, :cond_15

    const/4 v10, 0x1

    goto :goto_b

    :cond_15
    const/4 v10, 0x0

    :goto_b
    add-int/lit8 v10, v10, 0x4

    mul-int/lit8 v13, v12, 0xc

    if-lt v11, v13, :cond_16

    const/4 v13, 0x1

    goto :goto_c

    :cond_16
    const/4 v13, 0x0

    :goto_c
    add-int/2addr v10, v13

    mul-int/lit8 v12, v12, 0xf

    if-lt v11, v12, :cond_17

    const/4 v11, 0x1

    goto :goto_d

    :cond_17
    const/4 v11, 0x0

    :goto_d
    add-int v13, v10, v11

    .line 599
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v10

    invoke-virtual {v10, v13}, Lcom/github/junrar/unpack/ppm/FreqData;->incSummFreq(I)V

    .line 601
    :goto_e
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v10

    invoke-virtual {v10}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v10

    mul-int/lit8 v11, v9, 0x6

    add-int/2addr v10, v11

    invoke-virtual {v1, v10}, Lcom/github/junrar/unpack/ppm/State;->setAddress(I)V

    .line 602
    invoke-virtual {v1, v4}, Lcom/github/junrar/unpack/ppm/State;->setSuccessor(Lcom/github/junrar/unpack/ppm/PPMContext;)V

    .line 603
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSymbol()I

    move-result v10

    invoke-virtual {v1, v10}, Lcom/github/junrar/unpack/ppm/State;->setSymbol(I)V

    .line 604
    invoke-virtual {v1, v13}, Lcom/github/junrar/unpack/ppm/State;->setFreq(I)V

    add-int/lit8 v9, v9, 0x1

    .line 605
    invoke-virtual {v3, v9}, Lcom/github/junrar/unpack/ppm/PPMContext;->setNumStats(I)V

    .line 554
    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result v9

    invoke-virtual {v3, v9}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    goto/16 :goto_2

    .line 608
    :cond_18
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/StateRef;->getSuccessor()I

    move-result v0

    .line 609
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v1, v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 610
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v1, v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    return-void
.end method

.method private updateModelRestart()V
    .locals 1

    .line 470
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->restartModelRare()V

    const/4 v0, 0x0

    .line 471
    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    return-void
.end method


# virtual methods
.method public decodeChar()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 226
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v0

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v1

    const/4 v2, -0x1

    if-le v0, v1, :cond_c

    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 227
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v0

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeapEnd()I

    move-result v1

    if-le v0, v1, :cond_0

    goto/16 :goto_4

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    .line 232
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v0

    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v3

    if-le v0, v3, :cond_2

    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 233
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getFreqData()Lcom/github/junrar/unpack/ppm/FreqData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/FreqData;->getStats()I

    move-result v0

    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeapEnd()I

    move-result v3

    if-le v0, v3, :cond_1

    goto :goto_0

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/ppm/PPMContext;->decodeSymbol1(Lcom/github/junrar/unpack/ppm/ModelPPM;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_2
    :goto_0
    return v2

    .line 240
    :cond_3
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/ppm/PPMContext;->decodeBinSymbol(Lcom/github/junrar/unpack/ppm/ModelPPM;)V

    .line 242
    :cond_4
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/RangeCoder;->decode()V

    .line 243
    :goto_1
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/State;->getAddress()I

    move-result v0

    if-nez v0, :cond_9

    .line 244
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/RangeCoder;->ariDecNormalize()V

    .line 246
    :cond_5
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    .line 247
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getSuffix()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 248
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v0

    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v3

    if-le v0, v3, :cond_8

    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 249
    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result v0

    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeapEnd()I

    move-result v3

    if-le v0, v3, :cond_6

    goto :goto_2

    .line 252
    :cond_6
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/PPMContext;->getNumStats()I

    move-result v0

    iget v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->numMasked:I

    if-eq v0, v3, :cond_5

    .line 253
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v0, p0}, Lcom/github/junrar/unpack/ppm/PPMContext;->decodeSymbol2(Lcom/github/junrar/unpack/ppm/ModelPPM;)Z

    move-result v0

    if-nez v0, :cond_7

    return v2

    .line 256
    :cond_7
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/RangeCoder;->decode()V

    goto :goto_1

    :cond_8
    :goto_2
    return v2

    .line 258
    :cond_9
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/State;->getSymbol()I

    move-result v0

    .line 259
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v1

    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v2}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getPText()I

    move-result v2

    if-le v1, v2, :cond_a

    .line 261
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/State;->getSuccessor()I

    move-result v1

    .line 262
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v2, v1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    .line 263
    iget-object v2, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {v2, v1}, Lcom/github/junrar/unpack/ppm/PPMContext;->setAddress(I)V

    goto :goto_3

    .line 265
    :cond_a
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->updateModel()V

    .line 267
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    if-nez v1, :cond_b

    .line 268
    invoke-direct {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->clearMask()V

    .line 271
    :cond_b
    :goto_3
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v1}, Lcom/github/junrar/unpack/ppm/RangeCoder;->ariDecNormalize()V

    return v0

    :cond_c
    :goto_4
    return v2
.end method

.method public decodeInit(Lcom/github/junrar/unpack/Unpack;I)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/github/junrar/exception/RarException;
        }
    .end annotation

    .line 182
    invoke-virtual {p1}, Lcom/github/junrar/unpack/Unpack;->getChar()I

    move-result p2

    and-int/lit8 v0, p2, 0x20

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 187
    invoke-virtual {p1}, Lcom/github/junrar/unpack/Unpack;->getChar()I

    move-result v3

    goto :goto_1

    .line 189
    :cond_1
    iget-object v3, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->GetAllocatedMemory()I

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    const/4 v3, 0x0

    :goto_1
    and-int/lit8 v4, p2, 0x40

    if-eqz v4, :cond_3

    .line 194
    invoke-virtual {p1}, Lcom/github/junrar/unpack/Unpack;->getChar()I

    move-result v4

    .line 195
    invoke-virtual {p1, v4}, Lcom/github/junrar/unpack/Unpack;->setPpmEscChar(I)V

    .line 197
    :cond_3
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v4, p1}, Lcom/github/junrar/unpack/ppm/RangeCoder;->initDecoder(Lcom/github/junrar/unpack/Unpack;)V

    if-eqz v0, :cond_8

    and-int/lit8 p1, p2, 0x1f

    add-int/lit8 p2, p1, 0x1

    const/16 v0, 0x10

    if-le p2, v0, :cond_4

    add-int/lit8 p1, p1, -0xf

    mul-int/lit8 p1, p1, 0x3

    add-int/lit8 p2, p1, 0x10

    :cond_4
    if-ne p2, v1, :cond_5

    .line 204
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/SubAllocator;->stopSubAllocator()V

    return v2

    .line 207
    :cond_5
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    add-int/2addr v3, v1

    invoke-virtual {p1, v3}, Lcom/github/junrar/unpack/ppm/SubAllocator;->startSubAllocator(I)Z

    .line 208
    new-instance p1, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v3

    invoke-direct {p1, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 209
    new-instance p1, Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v3

    invoke-direct {p1, v3}, Lcom/github/junrar/unpack/ppm/PPMContext;-><init>([B)V

    iput-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    .line 210
    new-instance p1, Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getHeap()[B

    move-result-object v3

    invoke-direct {p1, v3}, Lcom/github/junrar/unpack/ppm/State;-><init>([B)V

    iput-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    .line 211
    new-instance p1, Lcom/github/junrar/unpack/ppm/SEE2Context;

    invoke-direct {p1}, Lcom/github/junrar/unpack/ppm/SEE2Context;-><init>()V

    iput-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->dummySEE2Cont:Lcom/github/junrar/unpack/ppm/SEE2Context;

    const/4 p1, 0x0

    :goto_2
    const/16 v3, 0x19

    if-ge p1, v3, :cond_7

    const/4 v3, 0x0

    :goto_3
    if-ge v3, v0, :cond_6

    .line 214
    iget-object v4, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->SEE2Cont:[[Lcom/github/junrar/unpack/ppm/SEE2Context;

    aget-object v4, v4, p1

    new-instance v5, Lcom/github/junrar/unpack/ppm/SEE2Context;

    invoke-direct {v5}, Lcom/github/junrar/unpack/ppm/SEE2Context;-><init>()V

    aput-object v5, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 217
    :cond_7
    invoke-direct {p0, p2}, Lcom/github/junrar/unpack/ppm/ModelPPM;->startModelRare(I)V

    .line 219
    :cond_8
    iget-object p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->minContext:Lcom/github/junrar/unpack/ppm/PPMContext;

    invoke-virtual {p1}, Lcom/github/junrar/unpack/ppm/PPMContext;->getAddress()I

    move-result p1

    if-eqz p1, :cond_9

    return v1

    :cond_9
    return v2
.end method

.method public getBinSumm()[[I
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->binSumm:[[I

    return-object v0
.end method

.method public getCharMask()[I
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->charMask:[I

    return-object v0
.end method

.method public getCoder()Lcom/github/junrar/unpack/ppm/RangeCoder;
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    return-object v0
.end method

.method public getDummySEE2Cont()Lcom/github/junrar/unpack/ppm/SEE2Context;
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->dummySEE2Cont:Lcom/github/junrar/unpack/ppm/SEE2Context;

    return-object v0
.end method

.method public getEscCount()I
    .locals 1

    .line 292
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    return v0
.end method

.method public getFoundState()Lcom/github/junrar/unpack/ppm/State;
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    return-object v0
.end method

.method public getHB2Flag()[I
    .locals 1

    .line 356
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->HB2Flag:[I

    return-object v0
.end method

.method public getHeap()[B
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v0}, Lcom/github/junrar/unpack/ppm/SubAllocator;->getHeap()[B

    move-result-object v0

    return-object v0
.end method

.method public getHiBitsFlag()I
    .locals 1

    .line 340
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->hiBitsFlag:I

    return v0
.end method

.method public getInitEsc()I
    .locals 1

    .line 316
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initEsc:I

    return v0
.end method

.method public getInitRL()I
    .locals 1

    .line 284
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initRL:I

    return v0
.end method

.method public getNS2BSIndx()[I
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2BSIndx:[I

    return-object v0
.end method

.method public getNS2Indx()[I
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->NS2Indx:[I

    return-object v0
.end method

.method public getNumMasked()I
    .locals 1

    .line 304
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->numMasked:I

    return v0
.end method

.method public getOrderFall()I
    .locals 1

    .line 376
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    return v0
.end method

.method public getPrevSuccess()I
    .locals 1

    .line 336
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->prevSuccess:I

    return v0
.end method

.method public getRunLength()I
    .locals 1

    .line 328
    iget v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->runLength:I

    return v0
.end method

.method public getSEE2Cont()[[Lcom/github/junrar/unpack/ppm/SEE2Context;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->SEE2Cont:[[Lcom/github/junrar/unpack/ppm/SEE2Context;

    return-object v0
.end method

.method public getSubAlloc()Lcom/github/junrar/unpack/ppm/SubAllocator;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    return-object v0
.end method

.method public incEscCount(I)V
    .locals 1

    .line 296
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getEscCount()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->setEscCount(I)V

    return-void
.end method

.method public incRunLength(I)V
    .locals 1

    .line 332
    invoke-virtual {p0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->getRunLength()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/github/junrar/unpack/ppm/ModelPPM;->setRunLength(I)V

    return-void
.end method

.method public setEscCount(I)V
    .locals 0

    and-int/lit16 p1, p1, 0xff

    .line 288
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    return-void
.end method

.method public setHiBitsFlag(I)V
    .locals 0

    and-int/lit16 p1, p1, 0xff

    .line 344
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->hiBitsFlag:I

    return-void
.end method

.method public setInitEsc(I)V
    .locals 0

    .line 320
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initEsc:I

    return-void
.end method

.method public setNumMasked(I)V
    .locals 0

    .line 308
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->numMasked:I

    return-void
.end method

.method public setPrevSuccess(I)V
    .locals 0

    and-int/lit16 p1, p1, 0xff

    .line 312
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->prevSuccess:I

    return-void
.end method

.method public setRunLength(I)V
    .locals 0

    .line 324
    iput p1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->runLength:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 623
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ModelPPM[\n  numMasked="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 626
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->numMasked:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 627
    const-string v1, "\n  initEsc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initEsc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 629
    const-string v1, "\n  orderFall="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->orderFall:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 631
    const-string v1, "\n  maxOrder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 632
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->maxOrder:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 633
    const-string v1, "\n  runLength="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 634
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->runLength:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 635
    const-string v1, "\n  initRL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->initRL:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 637
    const-string v1, "\n  escCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->escCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 639
    const-string v1, "\n  prevSuccess="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    iget v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->prevSuccess:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 641
    const-string v1, "\n  foundState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->foundState:Lcom/github/junrar/unpack/ppm/State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 643
    const-string v1, "\n  coder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->coder:Lcom/github/junrar/unpack/ppm/RangeCoder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 645
    const-string v1, "\n  subAlloc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    iget-object v1, p0, Lcom/github/junrar/unpack/ppm/ModelPPM;->subAlloc:Lcom/github/junrar/unpack/ppm/SubAllocator;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 647
    const-string v1, "\n]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 648
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
