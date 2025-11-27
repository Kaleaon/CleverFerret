.class public Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
.super Ljava/lang/Object;
.source "UpdateFileRequestArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

.field protected description:Ljava/lang/String;

.field protected destination:Ljava/lang/String;

.field protected final id:Ljava/lang/String;

.field protected open:Ljava/lang/Boolean;

.field protected title:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 209
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 212
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->id:Ljava/lang/String;

    const/4 p1, 0x0

    .line 216
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->title:Ljava/lang/String;

    .line 217
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->destination:Ljava/lang/String;

    .line 218
    sget-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    iput-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    .line 219
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->open:Ljava/lang/Boolean;

    .line 220
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->description:Ljava/lang/String;

    return-void

    .line 213
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'id\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 210
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'id\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 207
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'id\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;
    .locals 7

    .line 324
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->title:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->destination:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    iget-object v5, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->open:Ljava/lang/Boolean;

    iget-object v6, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->description:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-object v0
.end method

.method public withDeadline(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 285
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    return-object p0

    .line 288
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 0

    .line 313
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withDestination(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 259
    const-string v0, "/(.|[\\r\\n])*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 260
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'destination\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 263
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->destination:Ljava/lang/String;

    return-object p0
.end method

.method public withOpen(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->open:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withTitle(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 236
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 237
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'title\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 240
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->title:Ljava/lang/String;

    return-object p0
.end method
