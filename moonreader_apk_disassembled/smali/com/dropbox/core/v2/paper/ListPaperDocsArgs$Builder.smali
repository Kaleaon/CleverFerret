.class public Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;
.super Ljava/lang/Object;
.source "ListPaperDocsArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected filterBy:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

.field protected limit:I

.field protected sortBy:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

.field protected sortOrder:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    sget-object v0, Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;->DOCS_ACCESSED:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    iput-object v0, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->filterBy:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    .line 146
    sget-object v0, Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;->ACCESSED:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    iput-object v0, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortBy:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    .line 147
    sget-object v0, Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;->ASCENDING:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    iput-object v0, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortOrder:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    const/16 v0, 0x3e8

    .line 148
    iput v0, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->limit:I

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;
    .locals 5

    .line 266
    new-instance v0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->filterBy:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortBy:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    iget-object v3, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortOrder:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    iget v4, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->limit:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;-><init>(Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;I)V

    return-object v0
.end method

.method public withFilterBy(Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 168
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->filterBy:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    return-object p0

    .line 171
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;->DOCS_ACCESSED:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->filterBy:Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Integer;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;
    .locals 2

    .line 244
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_2

    .line 247
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x3e8

    if-gt v0, v1, :cond_1

    if-eqz p1, :cond_0

    .line 251
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->limit:I

    return-object p0

    .line 254
    :cond_0
    iput v1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->limit:I

    return-object p0

    .line 248
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'limit\' is larger than 1000"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 245
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'limit\' is smaller than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withSortBy(Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 193
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortBy:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    return-object p0

    .line 196
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;->ACCESSED:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortBy:Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;

    return-object p0
.end method

.method public withSortOrder(Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 218
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortOrder:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    return-object p0

    .line 221
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;->ASCENDING:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    iput-object p1, p0, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->sortOrder:Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;

    return-object p0
.end method
