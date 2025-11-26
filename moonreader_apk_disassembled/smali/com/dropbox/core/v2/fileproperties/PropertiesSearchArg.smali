.class Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;
.super Ljava/lang/Object;
.source "PropertiesSearchArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;
    }
.end annotation


# instance fields
.field protected final queries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;",
            ">;)V"
        }
    .end annotation

    .line 71
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->FILTER_NONE:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;-><init>(Ljava/util/List;Lcom/dropbox/core/v2/fileproperties/TemplateFilter;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/dropbox/core/v2/fileproperties/TemplateFilter;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;",
            ">;",
            "Lcom/dropbox/core/v2/fileproperties/TemplateFilter;",
            ")V"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_3

    .line 47
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'queries\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 52
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->queries:Ljava/util/List;

    if-eqz p2, :cond_2

    .line 56
    iput-object p2, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    return-void

    .line 54
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'templateFilter\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "List \'queries\' has fewer than 1 items"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 42
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'queries\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 114
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 115
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;

    .line 116
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->queries:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->queries:Ljava/util/List;

    if-eq v2, v3, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    if-eq v2, p1, :cond_4

    .line 117
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/TemplateFilter;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getQueries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertiesSearchQuery;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->queries:Ljava/util/List;

    return-object v0
.end method

.method public getTemplateFilter()Lcom/dropbox/core/v2/fileproperties/TemplateFilter;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 98
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->queries:Ljava/util/List;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg;->templateFilter:Lcom/dropbox/core/v2/fileproperties/TemplateFilter;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 127
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 139
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/PropertiesSearchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
