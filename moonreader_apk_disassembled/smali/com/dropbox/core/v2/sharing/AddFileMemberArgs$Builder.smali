.class public Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;
.super Ljava/lang/Object;
.source "AddFileMemberArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected addMessageAsComment:Z

.field protected customMessage:Ljava/lang/String;

.field protected final file:Ljava/lang/String;

.field protected final members:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberSelector;",
            ">;"
        }
    .end annotation
.end field

.field protected quiet:Z


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberSelector;",
            ">;)V"
        }
    .end annotation

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_5

    .line 219
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_4

    .line 222
    const-string v0, "((/|id:).*|nspath:[0-9]+:.*)|ns:[0-9]+(/.*)?"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 225
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->file:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 229
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 231
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 234
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->members:Ljava/util/List;

    const/4 p1, 0x0

    .line 235
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->customMessage:Ljava/lang/String;

    const/4 p1, 0x0

    .line 236
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->quiet:Z

    .line 237
    sget-object p2, Lcom/dropbox/core/v2/sharing/AccessLevel;->VIEWER:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 238
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->addMessageAsComment:Z

    return-void

    .line 227
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 223
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'file\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 220
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'file\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 217
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'file\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;
    .locals 7

    .line 330
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->file:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->members:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->customMessage:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->quiet:Z

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-boolean v6, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->addMessageAsComment:Z

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;ZLcom/dropbox/core/v2/sharing/AccessLevel;Z)V

    return-object v0
.end method

.method public withAccessLevel(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 293
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object p0

    .line 296
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/sharing/AccessLevel;->VIEWER:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object p0
.end method

.method public withAddMessageAsComment(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 315
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->addMessageAsComment:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 318
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->addMessageAsComment:Z

    return-object p0
.end method

.method public withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;
    .locals 0

    .line 250
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->customMessage:Ljava/lang/String;

    return-object p0
.end method

.method public withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 268
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->quiet:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 271
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->quiet:Z

    return-object p0
.end method
