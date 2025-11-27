.class public Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
.super Ljava/lang/Object;
.source "MutableAttributeImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/MutableAttribute;


# instance fields
.field private final myName:Ljava/lang/String;

.field private myValue:Ljava/lang/String;

.field private final myValueListDelimiter:C

.field private final myValueNameDelimiter:C

.field private myValues:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    .line 18
    iput-char p3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    .line 19
    iput-char p4, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    if-nez p2, :cond_0

    .line 20
    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;)C
    .locals 0

    .line 8
    iget-char p0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    return p0
.end method

.method private forEachValue(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/BiConsumer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Lcom/vladsch/flexmark/util/BiConsumer<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 181
    const-string v0, ""

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 183
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_7

    .line 184
    iget-char v3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 186
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_2

    :cond_1
    move v5, v3

    :goto_2
    if-ge v2, v5, :cond_5

    .line 188
    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 189
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5

    .line 190
    iget-char v6, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    if-nez v6, :cond_2

    const/4 v6, -0x1

    goto :goto_3

    :cond_2
    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    :goto_3
    if-ne v6, v4, :cond_3

    move-object v7, v2

    goto :goto_4

    .line 191
    :cond_3
    invoke-virtual {v2, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :goto_4
    if-ne v6, v4, :cond_4

    move-object v2, v0

    goto :goto_5

    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 192
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 194
    :goto_5
    invoke-interface {p2, v7, v2}, Lcom/vladsch/flexmark/util/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5
    if-ne v3, v4, :cond_6

    goto :goto_6

    :cond_6
    add-int/lit8 v2, v5, 0x1

    goto :goto_1

    :cond_7
    :goto_6
    return-void
.end method

.method public static of(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 3

    .line 261
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValueListDelimiter()C

    move-result v2

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValueNameDelimiter()C

    move-result p0

    invoke-static {v0, v1, v2, p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 265
    invoke-static {p0, p0, v0, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 269
    invoke-static {p0, p1, v0, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;C)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 273
    invoke-static {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 1

    .line 277
    const-string v0, "class"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 278
    new-instance p2, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    const/16 p3, 0x20

    const/4 v0, 0x0

    invoke-direct {p2, p0, p1, p3, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object p2

    .line 279
    :cond_0
    const-string v0, "style"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 280
    new-instance p2, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    const/16 p3, 0x3b

    const/16 v0, 0x3a

    invoke-direct {p2, p0, p1, p3, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object p2

    .line 282
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object v0
.end method


# virtual methods
.method public containsValue(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 230
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    invoke-static {v0, p1, v1, v2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->indexOfValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public copy()Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 1

    .line 46
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 236
    :cond_0
    instance-of v1, p1, Lcom/vladsch/flexmark/util/html/Attribute;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 238
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 240
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 241
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->valueFromMap()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    return-object v0
.end method

.method public getValueListDelimiter()C
    .locals 1

    .line 26
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    return v0
.end method

.method protected getValueMap()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_6

    .line 70
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    .line 71
    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    const-string v2, ""

    if-eqz v1, :cond_5

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 74
    :goto_0
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_6

    .line 75
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    iget-char v4, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 77
    iget-object v5, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_1

    :cond_0
    move v5, v3

    :goto_1
    if-ge v1, v5, :cond_3

    .line 79
    iget-object v6, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v6, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 80
    iget-char v6, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    if-eqz v6, :cond_1

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    goto :goto_2

    :cond_1
    const/4 v6, -0x1

    :goto_2
    if-ne v6, v4, :cond_2

    .line 83
    iget-object v6, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 85
    :cond_2
    iget-object v7, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v8, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    :goto_3
    if-ne v3, v4, :cond_4

    goto :goto_4

    :cond_4
    add-int/lit8 v1, v5, 0x1

    goto :goto_0

    .line 93
    :cond_5
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    :cond_6
    :goto_4
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public getValueNameDelimiter()C
    .locals 1

    .line 31
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 247
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 248
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isNonRendering()Z
    .locals 2

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->NON_RENDERING_WHEN_EMPTY:Ljava/util/Set;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 5

    .line 204
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    .line 205
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 206
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->getValueMap()Ljava/util/Map;

    move-result-object v0

    const/4 v2, 0x1

    .line 207
    new-array v2, v2, [Z

    const/4 v3, 0x0

    aput-boolean v3, v2, v3

    .line 209
    new-instance v4, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;

    invoke-direct {v4, p0, v0, v2}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$2;-><init>(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;Ljava/util/Map;[Z)V

    invoke-direct {p0, p1, v4}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->forEachValue(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/BiConsumer;)V

    .line 218
    aget-boolean p1, v2, v3

    if-eqz p1, :cond_1

    iput-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    return-object p0

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    return-object p0

    .line 222
    :cond_2
    :goto_0
    const-string p1, ""

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    .line 223
    iput-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    return-object p0
.end method

.method public bridge synthetic replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 2

    if-nez p1, :cond_0

    .line 144
    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 145
    :goto_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    return-object p0

    .line 146
    :cond_2
    :goto_1
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    const/4 p1, 0x0

    .line 147
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    return-object p0
.end method

.method public resetToValuesMap()V
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    return-void

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "resetToValuesMap called when myValues is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 0

    .line 8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;
    .locals 3

    .line 153
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    .line 154
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 155
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->getValueMap()Ljava/util/Map;

    move-result-object v0

    .line 157
    new-instance v2, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;

    invoke-direct {v2, p0, v0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl$1;-><init>(Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;Ljava/util/Map;)V

    invoke-direct {p0, p1, v2}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->forEachValue(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/BiConsumer;)V

    .line 168
    iput-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    return-object p0

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    return-object p0

    :cond_2
    :goto_0
    if-nez p1, :cond_3

    .line 172
    const-string p1, ""

    goto :goto_1

    :cond_3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    .line 173
    iput-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    return-object p0
.end method

.method public bridge synthetic toImmutable()Lcom/vladsch/flexmark/util/Immutable;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->toImmutable()Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object v0

    return-object v0
.end method

.method public toImmutable()Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 36
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toMutable()Lcom/vladsch/flexmark/util/Mutable;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object v0

    return-object v0
.end method

.method public toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MutableAttributeImpl { myName=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', myValue=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected valueFromMap()Ljava/lang/String;
    .locals 6

    .line 108
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    const-string v1, ""

    if-eqz v0, :cond_4

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    if-eqz v2, :cond_1

    .line 112
    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    .line 113
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 114
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueNameDelimiter:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v1, v2

    goto :goto_0

    .line 122
    :cond_1
    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValueListDelimiter:C

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    .line 123
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 124
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v1, v2

    goto :goto_1

    .line 131
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    goto :goto_3

    .line 133
    :cond_4
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValues:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    :cond_6
    :goto_2
    iput-object v1, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    .line 135
    :goto_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->myValue:Ljava/lang/String;

    return-object v0
.end method
