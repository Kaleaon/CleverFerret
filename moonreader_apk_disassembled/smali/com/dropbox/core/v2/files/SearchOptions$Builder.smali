.class public Lcom/dropbox/core/v2/files/SearchOptions$Builder;
.super Ljava/lang/Object;
.source "SearchOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accountId:Ljava/lang/String;

.field protected fileCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/FileCategory;",
            ">;"
        }
    .end annotation
.end field

.field protected fileExtensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected fileStatus:Lcom/dropbox/core/v2/files/FileStatus;

.field protected filenameOnly:Z

.field protected maxResults:J

.field protected orderBy:Lcom/dropbox/core/v2/files/SearchOrderBy;

.field protected path:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 3

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 232
    iput-object v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->path:Ljava/lang/String;

    const-wide/16 v1, 0x64

    .line 233
    iput-wide v1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->maxResults:J

    .line 234
    iput-object v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->orderBy:Lcom/dropbox/core/v2/files/SearchOrderBy;

    .line 235
    sget-object v1, Lcom/dropbox/core/v2/files/FileStatus;->ACTIVE:Lcom/dropbox/core/v2/files/FileStatus;

    iput-object v1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileStatus:Lcom/dropbox/core/v2/files/FileStatus;

    const/4 v1, 0x0

    .line 236
    iput-boolean v1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->filenameOnly:Z

    .line 237
    iput-object v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileExtensions:Ljava/util/List;

    .line 238
    iput-object v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileCategories:Ljava/util/List;

    .line 239
    iput-object v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->accountId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/SearchOptions;
    .locals 10

    .line 433
    new-instance v0, Lcom/dropbox/core/v2/files/SearchOptions;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->path:Ljava/lang/String;

    iget-wide v2, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->maxResults:J

    iget-object v4, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->orderBy:Lcom/dropbox/core/v2/files/SearchOrderBy;

    iget-object v5, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileStatus:Lcom/dropbox/core/v2/files/FileStatus;

    iget-boolean v6, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->filenameOnly:Z

    iget-object v7, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileExtensions:Ljava/util/List;

    iget-object v8, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileCategories:Ljava/util/List;

    iget-object v9, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->accountId:Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/files/SearchOptions;-><init>(Ljava/lang/String;JLcom/dropbox/core/v2/files/SearchOrderBy;Lcom/dropbox/core/v2/files/FileStatus;ZLjava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-object v0
.end method

.method public withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 415
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x28

    if-lt v0, v1, :cond_1

    .line 418
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 419
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'accountId\' is longer than 40"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 416
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'accountId\' is shorter than 40"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 422
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->accountId:Ljava/lang/String;

    return-object p0
.end method

.method public withFileCategories(Ljava/util/List;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/FileCategory;",
            ">;)",
            "Lcom/dropbox/core/v2/files/SearchOptions$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 392
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/files/FileCategory;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 394
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'fileCategories\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 398
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileCategories:Ljava/util/List;

    return-object p0
.end method

.method public withFileExtensions(Ljava/util/List;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/SearchOptions$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 368
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 370
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'fileExtensions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 374
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileExtensions:Ljava/util/List;

    return-object p0
.end method

.method public withFileStatus(Lcom/dropbox/core/v2/files/FileStatus;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 325
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileStatus:Lcom/dropbox/core/v2/files/FileStatus;

    return-object p0

    .line 328
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/FileStatus;->ACTIVE:Lcom/dropbox/core/v2/files/FileStatus;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->fileStatus:Lcom/dropbox/core/v2/files/FileStatus;

    return-object p0
.end method

.method public withFilenameOnly(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 346
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->filenameOnly:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 349
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->filenameOnly:Z

    return-object p0
.end method

.method public withMaxResults(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 5

    .line 280
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 283
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    if-eqz p1, :cond_0

    .line 287
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->maxResults:J

    return-object p0

    :cond_0
    const-wide/16 v0, 0x64

    .line 290
    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->maxResults:J

    return-object p0

    .line 284
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'maxResults\' is larger than 1000L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 281
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'maxResults\' is smaller than 1L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withOrderBy(Lcom/dropbox/core/v2/files/SearchOrderBy;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 0

    .line 304
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->orderBy:Lcom/dropbox/core/v2/files/SearchOrderBy;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchOptions$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 256
    const-string v0, "(/(.|[\\r\\n])*)?|id:.*|(ns:[0-9]+(/.*)?)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 257
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 260
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchOptions$Builder;->path:Ljava/lang/String;

    return-object p0
.end method
