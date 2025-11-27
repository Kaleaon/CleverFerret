.class public Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;
.super Ljava/lang/Object;
.source "ListSharedLinksArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/ListSharedLinksArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected cursor:Ljava/lang/String;

.field protected directOnly:Ljava/lang/Boolean;

.field protected path:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 117
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->path:Ljava/lang/String;

    .line 118
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->cursor:Ljava/lang/String;

    .line 119
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->directOnly:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/ListSharedLinksArg;
    .locals 4

    .line 177
    new-instance v0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->cursor:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->directOnly:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->cursor:Ljava/lang/String;

    return-object p0
.end method

.method public withDirectOnly(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->directOnly:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 136
    const-string v0, "(/(.|[\\r\\n])*|id:.*)|(rev:[0-9a-f]{9,})|(ns:[0-9]+(/.*)?)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 140
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ListSharedLinksArg$Builder;->path:Ljava/lang/String;

    return-object p0
.end method
