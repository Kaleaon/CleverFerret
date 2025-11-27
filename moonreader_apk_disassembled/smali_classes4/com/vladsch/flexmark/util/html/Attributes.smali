.class public Lcom/vladsch/flexmark/util/html/Attributes;
.super Ljava/lang/Object;
.source "Attributes.java"


# static fields
.field public static final EMPTY:Lcom/vladsch/flexmark/util/html/Attributes;


# instance fields
.field private myAttributes:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Attributes;->EMPTY:Lcom/vladsch/flexmark/util/html/Attributes;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 18
    iget-object v0, p1, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public addValue(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 72
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p1

    return-object p1
.end method

.method public addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 2

    .line 84
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_0

    .line 86
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p1

    goto :goto_0

    .line 88
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    if-eqz p1, :cond_1

    .line 89
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/html/Attribute;->setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p1

    goto :goto_0

    .line 90
    :cond_1
    invoke-static {v0, p2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p1

    .line 92
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/Attributes;->getAttributes()Ljava/util/LinkedHashMap;

    move-result-object p2

    invoke-virtual {p2, v0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public addValues(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 2

    .line 76
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/html/Attributes;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 77
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 133
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public contains(Ljava/lang/CharSequence;)Z
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 118
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public containsValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 123
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    if-eqz p1, :cond_1

    .line 125
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/html/Attribute;->containsValue(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ">;>;"
        }
    .end annotation

    .line 148
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public forEach(Lcom/vladsch/flexmark/util/BiConsumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/BiConsumer<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ">;)V"
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    .line 153
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 154
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public get(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 32
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getAttributes()Ljava/util/LinkedHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public getValue(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    const-string v1, ""

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 38
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/Attribute;

    if-nez p1, :cond_1

    return-object v1

    .line 41
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

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

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public remove(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 0

    .line 101
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 2

    .line 164
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 167
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 168
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public removeValue(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 97
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->removeValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p1

    return-object p1
.end method

.method public removeValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 108
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 109
    invoke-interface {v0, p2}, Lcom/vladsch/flexmark/util/html/Attribute;->removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p2

    .line 110
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/Attributes;->getAttributes()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public replaceValue(Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 45
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p1

    return-object p1
.end method

.method public replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 58
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 61
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p2

    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/Attribute;

    if-eqz v0, :cond_1

    .line 64
    invoke-interface {v0, p2}, Lcom/vladsch/flexmark/util/html/Attribute;->replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    move-result-object p2

    goto :goto_0

    .line 65
    :cond_1
    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p2

    .line 67
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/Attributes;->getAttributes()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public replaceValues(Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 174
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    return-void

    .line 176
    :cond_0
    iget-object p1, p1, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public size()I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/Attributes;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, ""

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 185
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    iget-object v2, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 187
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\\""

    const-string v4, "\""

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    :cond_0
    const-string v2, " "

    goto :goto_0

    .line 191
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Attributes{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x7d

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ">;"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/Attributes;->myAttributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method
