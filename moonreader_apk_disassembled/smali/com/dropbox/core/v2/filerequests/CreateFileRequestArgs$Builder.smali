.class public Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;
.super Ljava/lang/Object;
.source "CreateFileRequestArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected deadline:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

.field protected description:Ljava/lang/String;

.field protected final destination:Ljava/lang/String;

.field protected open:Z

.field protected final title:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 189
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_2

    .line 192
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->title:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 196
    const-string p1, "/(.|[\\r\\n])*"

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 199
    iput-object p2, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->destination:Ljava/lang/String;

    const/4 p1, 0x0

    .line 200
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    .line 201
    iput-boolean v1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->open:Z

    .line 202
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->description:Ljava/lang/String;

    return-void

    .line 197
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'destination\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 194
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'destination\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 190
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'title\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 187
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'title\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;
    .locals 6

    .line 260
    new-instance v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->title:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->destination:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    iget-boolean v4, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->open:Z

    iget-object v5, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->description:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;ZLjava/lang/String;)V

    return-object v0
.end method

.method public withDeadline(Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->deadline:Lcom/dropbox/core/v2/filerequests/FileRequestDeadline;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;
    .locals 0

    .line 249
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withOpen(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 233
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->open:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 236
    iput-boolean p1, p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestArgs$Builder;->open:Z

    return-object p0
.end method
