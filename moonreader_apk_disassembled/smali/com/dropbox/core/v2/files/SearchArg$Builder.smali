.class public Lcom/dropbox/core/v2/files/SearchArg$Builder;
.super Ljava/lang/Object;
.source "SearchArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected maxResults:J

.field protected mode:Lcom/dropbox/core/v2/files/SearchMode;

.field protected final path:Ljava/lang/String;

.field protected final query:Ljava/lang/String;

.field protected start:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 202
    const-string v0, "(/(.|[\\r\\n])*)?|id:.*|(ns:[0-9]+(/.*)?)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 205
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->path:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 209
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x3e8

    if-gt p1, v0, :cond_0

    .line 212
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->query:Ljava/lang/String;

    const-wide/16 p1, 0x0

    .line 213
    iput-wide p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->start:J

    const-wide/16 p1, 0x64

    .line 214
    iput-wide p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->maxResults:J

    .line 215
    sget-object p1, Lcom/dropbox/core/v2/files/SearchMode;->FILENAME:Lcom/dropbox/core/v2/files/SearchMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->mode:Lcom/dropbox/core/v2/files/SearchMode;

    return-void

    .line 210
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'query\' is longer than 1000"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 207
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'query\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 203
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'path\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 200
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'path\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/SearchArg;
    .locals 8

    .line 311
    new-instance v0, Lcom/dropbox/core/v2/files/SearchArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->query:Ljava/lang/String;

    iget-wide v3, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->start:J

    iget-wide v5, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->maxResults:J

    iget-object v7, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->mode:Lcom/dropbox/core/v2/files/SearchMode;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/files/SearchArg;-><init>(Ljava/lang/String;Ljava/lang/String;JJLcom/dropbox/core/v2/files/SearchMode;)V

    return-object v0
.end method

.method public withMaxResults(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/SearchArg$Builder;
    .locals 5

    .line 262
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 265
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    if-eqz p1, :cond_0

    .line 269
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->maxResults:J

    return-object p0

    :cond_0
    const-wide/16 v0, 0x64

    .line 272
    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->maxResults:J

    return-object p0

    .line 266
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'maxResults\' is larger than 1000L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 263
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'maxResults\' is smaller than 1L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withMode(Lcom/dropbox/core/v2/files/SearchMode;)Lcom/dropbox/core/v2/files/SearchArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 296
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->mode:Lcom/dropbox/core/v2/files/SearchMode;

    return-object p0

    .line 299
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/files/SearchMode;->FILENAME:Lcom/dropbox/core/v2/files/SearchMode;

    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->mode:Lcom/dropbox/core/v2/files/SearchMode;

    return-object p0
.end method

.method public withStart(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/SearchArg$Builder;
    .locals 5

    .line 234
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x270f

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    if-eqz p1, :cond_0

    .line 238
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->start:J

    return-object p0

    :cond_0
    const-wide/16 v0, 0x0

    .line 241
    iput-wide v0, p0, Lcom/dropbox/core/v2/files/SearchArg$Builder;->start:J

    return-object p0

    .line 235
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'start\' is larger than 9999L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
