.class public Lcom/radaee/pdf/adv/Obj;
.super Ljava/lang/Object;
.source "Obj.java"


# instance fields
.field protected hand:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-wide p1, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    return-void
.end method

.method private static final adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 46
    :cond_0
    new-instance v0, Lcom/radaee/pdf/adv/Obj;

    invoke-direct {v0, p0, p1}, Lcom/radaee/pdf/adv/Obj;-><init>(J)V

    return-object v0
.end method

.method private static adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 51
    :cond_0
    new-instance v0, Lcom/radaee/pdf/adv/Ref;

    invoke-direct {v0, p0, p1}, Lcom/radaee/pdf/adv/Ref;-><init>(J)V

    return-object v0
.end method

.method private static native arrayAppendItem(J)V
.end method

.method private static native arrayClear(J)V
.end method

.method private static native arrayGetItem(JI)J
.end method

.method private static native arrayGetItemCount(J)I
.end method

.method private static native arrayInsertItem(JI)V
.end method

.method private static native arrayRemoveItem(JI)V
.end method

.method private static native dictGetItemByIndex(JI)J
.end method

.method private static native dictGetItemByName(JLjava/lang/String;)J
.end method

.method private static native dictGetItemCount(J)I
.end method

.method private static native dictGetItemName(JI)Ljava/lang/String;
.end method

.method private static native dictRemoveItem(JLjava/lang/String;)V
.end method

.method private static native dictSetItem(JLjava/lang/String;)V
.end method

.method private static native getAsciiString(J)Ljava/lang/String;
.end method

.method private static native getBoolean(J)Z
.end method

.method private static native getHexString(J)[B
.end method

.method private static native getInt(J)I
.end method

.method private static native getName(J)Ljava/lang/String;
.end method

.method private static native getReal(J)F
.end method

.method private static native getReference(J)J
.end method

.method private static native getTextString(J)Ljava/lang/String;
.end method

.method private static native getType(J)I
.end method

.method private static native setAsciiString(JLjava/lang/String;)V
.end method

.method private static native setBoolean(JZ)V
.end method

.method private static native setHexString(J[B)V
.end method

.method private static native setInt(JI)V
.end method

.method private static native setName(JLjava/lang/String;)V
.end method

.method private static native setReal(JF)V
.end method

.method private static native setReference(JJ)V
.end method

.method private static native setTextString(JLjava/lang/String;)V
.end method


# virtual methods
.method public final ArrayAppendItem()V
    .locals 2

    .line 136
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->arrayAppendItem(J)V

    return-void
.end method

.method public final ArrayClear()V
    .locals 2

    .line 163
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->arrayClear(J)V

    return-void
.end method

.method public final ArrayGetItem(I)Lcom/radaee/pdf/adv/Obj;
    .locals 2

    .line 127
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->arrayGetItem(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;

    move-result-object p1

    return-object p1
.end method

.method public final ArrayGetItemCount()I
    .locals 2

    .line 117
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->arrayGetItemCount(J)I

    move-result v0

    return v0
.end method

.method public final ArrayInsertItem(I)V
    .locals 2

    .line 146
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->arrayInsertItem(JI)V

    return-void
.end method

.method public final ArrayRemoveItem(I)V
    .locals 2

    .line 155
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->arrayRemoveItem(JI)V

    return-void
.end method

.method public final DictGetItem(I)Lcom/radaee/pdf/adv/Obj;
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->dictGetItemByIndex(JI)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;

    move-result-object p1

    return-object p1
.end method

.method public final DictGetItem(Ljava/lang/String;)Lcom/radaee/pdf/adv/Obj;
    .locals 2

    .line 89
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->dictGetItemByName(JLjava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;

    move-result-object p1

    return-object p1
.end method

.method public final DictGetItemCount()I
    .locals 2

    .line 59
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->dictGetItemCount(J)I

    move-result v0

    return v0
.end method

.method public final DictGetItemTag(I)Ljava/lang/String;
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->dictGetItemName(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final DictRemoveItem(Ljava/lang/String;)V
    .locals 2

    .line 108
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->dictRemoveItem(JLjava/lang/String;)V

    return-void
.end method

.method public final DictSetItem(Ljava/lang/String;)V
    .locals 2

    .line 99
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->dictSetItem(JLjava/lang/String;)V

    return-void
.end method

.method public final GetAsciiString()Ljava/lang/String;
    .locals 2

    .line 237
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getAsciiString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetBoolean()Z
    .locals 2

    .line 172
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getBoolean(J)Z

    move-result v0

    return v0
.end method

.method public final GetHexString()[B
    .locals 2

    .line 253
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getHexString(J)[B

    move-result-object v0

    return-object v0
.end method

.method public final GetInt()I
    .locals 2

    .line 189
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getInt(J)I

    move-result v0

    return v0
.end method

.method public final GetName()Ljava/lang/String;
    .locals 2

    .line 221
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetReal()F
    .locals 2

    .line 205
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getReal(J)F

    move-result v0

    return v0
.end method

.method public final GetReference()Lcom/radaee/pdf/adv/Ref;
    .locals 2

    .line 286
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getReference(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object v0

    return-object v0
.end method

.method public final GetTextString()Ljava/lang/String;
    .locals 2

    .line 245
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getTextString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetType()I
    .locals 2

    .line 332
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->getType(J)I

    move-result v0

    return v0
.end method

.method public final SetArray()V
    .locals 2

    .line 312
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->arrayClear(J)V

    return-void
.end method

.method public final SetAsciiString(Ljava/lang/String;)V
    .locals 2

    .line 261
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setAsciiString(JLjava/lang/String;)V

    return-void
.end method

.method public final SetBoolean(Z)V
    .locals 2

    .line 181
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setBoolean(JZ)V

    return-void
.end method

.method public final SetDict()V
    .locals 2

    .line 303
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/adv/Obj;->dictGetItemCount(J)I

    return-void
.end method

.method public final SetHexString([B)V
    .locals 2

    .line 277
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setHexString(J[B)V

    return-void
.end method

.method public final SetInt(I)V
    .locals 2

    .line 197
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setInt(JI)V

    return-void
.end method

.method public final SetName(Ljava/lang/String;)V
    .locals 2

    .line 229
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setName(JLjava/lang/String;)V

    return-void
.end method

.method public final SetReal(F)V
    .locals 2

    .line 213
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setReal(JF)V

    return-void
.end method

.method public final SetReference(Lcom/radaee/pdf/adv/Ref;)V
    .locals 4

    .line 294
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/adv/Ref;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/adv/Obj;->setReference(JJ)V

    return-void
.end method

.method public final SetTextString(Ljava/lang/String;)V
    .locals 2

    .line 269
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/adv/Obj;->setTextString(JLjava/lang/String;)V

    return-void
.end method

.method public get_hand()J
    .locals 2

    .line 42
    iget-wide v0, p0, Lcom/radaee/pdf/adv/Obj;->hand:J

    return-wide v0
.end method
