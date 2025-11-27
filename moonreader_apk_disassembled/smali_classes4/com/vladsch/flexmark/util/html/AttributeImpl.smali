.class public Lcom/vladsch/flexmark/util/html/AttributeImpl;
.super Ljava/lang/Object;
.source "AttributeImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/Attribute;


# instance fields
.field private final myName:Ljava/lang/String;

.field private final myValue:Ljava/lang/String;

.field private final myValueListDelimiter:C

.field private final myValueNameDelimiter:C


# direct methods
.method private constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    .line 14
    iput-char p3, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueListDelimiter:C

    .line 15
    iput-char p4, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueNameDelimiter:C

    if-nez p2, :cond_0

    .line 16
    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    return-void
.end method

.method public static indexOfValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)I
    .locals 6

    .line 51
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_7

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    if-nez p2, :cond_2

    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v0

    :cond_1
    return v1

    .line 57
    :cond_2
    invoke-static {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 58
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v0, v3, :cond_7

    .line 59
    invoke-interface {v2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(Ljava/lang/CharSequence;I)I

    move-result v0

    if-ne v0, v1, :cond_3

    goto :goto_2

    .line 62
    :cond_3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    add-int/2addr v3, v0

    if-eqz v0, :cond_4

    add-int/lit8 v4, v0, -0x1

    .line 64
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    if-eq v5, p2, :cond_4

    if-eqz p3, :cond_5

    .line 65
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-ne v4, p3, :cond_5

    .line 66
    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v3, v4, :cond_6

    .line 67
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-eq v4, p2, :cond_6

    if-eqz p3, :cond_5

    .line 68
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-ne v4, p3, :cond_5

    goto :goto_1

    :cond_5
    add-int/lit8 v0, v3, 0x1

    goto :goto_0

    :cond_6
    :goto_1
    return v0

    :cond_7
    :goto_2
    return v1
.end method

.method public static of(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/AttributeImpl;
    .locals 3

    .line 129
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValueListDelimiter()C

    move-result v2

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValueNameDelimiter()C

    move-result p0

    invoke-static {v0, v1, v2, p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 133
    invoke-static {p0, p0, v0, v0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 137
    invoke-static {p0, p1, v0, v0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;C)Lcom/vladsch/flexmark/util/html/AttributeImpl;
    .locals 1

    const/4 v0, 0x0

    .line 141
    invoke-static {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;
    .locals 1

    .line 145
    const-string v0, "class"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    new-instance p2, Lcom/vladsch/flexmark/util/html/AttributeImpl;

    const/16 p3, 0x20

    const/4 v0, 0x0

    invoke-direct {p2, p0, p1, p3, v0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object p2

    .line 147
    :cond_0
    const-string v0, "style"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    new-instance p2, Lcom/vladsch/flexmark/util/html/AttributeImpl;

    const/16 p3, 0x3b

    const/16 v0, 0x3a

    invoke-direct {p2, p0, p1, p3, v0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object p2

    .line 150
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/html/AttributeImpl;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/AttributeImpl;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)V

    return-object v0
.end method


# virtual methods
.method public containsValue(Ljava/lang/CharSequence;)Z
    .locals 3

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueListDelimiter:C

    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueNameDelimiter:C

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

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 104
    :cond_0
    instance-of v1, p1, Lcom/vladsch/flexmark/util/html/Attribute;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 106
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 108
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 109
    :cond_2
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

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

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    return-object v0
.end method

.method public getValueListDelimiter()C
    .locals 1

    .line 26
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueListDelimiter:C

    return v0
.end method

.method public getValueNameDelimiter()C
    .locals 1

    .line 31
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueNameDelimiter:C

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 116
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isNonRendering()Z
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->NON_RENDERING_WHEN_EMPTY:Ljava/util/Set;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

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

.method public removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 97
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttribute;->removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object p1

    .line 98
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/MutableAttribute;->toImmutable()Lcom/vladsch/flexmark/util/Immutable;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    return-object p1
.end method

.method public replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueListDelimiter:C

    iget-char v2, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValueNameDelimiter:C

    invoke-static {v0, p1, v1, v2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;CC)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p1

    return-object p1
.end method

.method public setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 91
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/MutableAttribute;->setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object p1

    .line 92
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/MutableAttribute;->toImmutable()Lcom/vladsch/flexmark/util/Immutable;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    return-object p1
.end method

.method public bridge synthetic toMutable()Lcom/vladsch/flexmark/util/Mutable;
    .locals 1

    .line 6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;

    move-result-object v0

    return-object v0
.end method

.method public toMutable()Lcom/vladsch/flexmark/util/html/MutableAttribute;
    .locals 1

    .line 21
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;->of(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/MutableAttributeImpl;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AttributeImpl { myName=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', myValue=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/AttributeImpl;->myValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
