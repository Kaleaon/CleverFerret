.class public final Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
.super Ljava/lang/Object;
.source "TemplateFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;,
        Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;
    }
.end annotation


# static fields
.field public static final FILTER_NONE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

.field public static final OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

.field private filterSomeValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->withTag(Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->FILTER_NONE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->withTag(Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->FILTER_NONE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/fileproperties/TemplateFilter;)Ljava/util/List;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    return-object p0
.end method

.method public static filterSome(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/TemplateFilter;"
        }
    .end annotation

    if-eqz p0, :cond_5

    .line 151
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_4

    .line 154
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 158
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v3, v1, :cond_1

    .line 161
    const-string v3, "(/|ptid:).*"

    invoke-static {v3, v2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 162
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 159
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 156
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 165
    :cond_3
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->FILTER_SOME:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->withTagAndFilterSome(Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    move-result-object p0

    return-object p0

    .line 152
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "List has fewer than 1 items"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 149
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    return-object v0
.end method

.method private withTagAndFilterSome(Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/TemplateFilter;"
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    .line 102
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 226
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    if-eqz v2, :cond_7

    .line 227
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    .line 228
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 231
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$TemplateFilter$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 233
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    if-eq v2, p1, :cond_6

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getFilterSomeValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->FILTER_SOME:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    if-ne v0, v1, :cond_0

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    return-object v0

    .line 181
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FILTER_SOME, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->filterSomeValue:Ljava/util/List;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 214
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isFilterNone()Z
    .locals 2

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->FILTER_NONE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFilterSome()Z
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->FILTER_SOME:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->_tag:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 249
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 261
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
