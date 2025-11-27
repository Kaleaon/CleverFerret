.class public final Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
.super Ljava/lang/Object;
.source "UpdateFolderMemberError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;,
        Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;
    }
.end annotation


# static fields
.field public static final INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

.field public static final NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

.field private accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field private memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

.field private noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;)Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;)Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    return-object p0
.end method

.method public static accessError(Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 199
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object p0

    return-object p0

    .line 197
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static memberError(Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 246
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTagAndMemberError(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object p0

    return-object p0

    .line 244
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static noExplicitAccess(Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 2

    if-eqz p0, :cond_0

    .line 294
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    move-result-object p0

    return-object p0

    .line 292
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 1

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    .line 102
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    return-object v0
.end method

.method private withTagAndAccessError(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    .line 117
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0
.end method

.method private withTagAndMemberError(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 1

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    .line 131
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    .line 132
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    return-object v0
.end method

.method private withTagAndNoExplicitAccess(Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;Lcom/dropbox/core/v2/sharing/AddFolderMemberError;)Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;
    .locals 1

    .line 147
    new-instance v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;-><init>()V

    .line 148
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    .line 149
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

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

    .line 368
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    if-eqz v2, :cond_9

    .line 369
    check-cast p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;

    .line 370
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 373
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$1;->$SwitchMap$com$dropbox$core$v2$sharing$UpdateFolderMemberError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 379
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 377
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 375
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    :cond_9
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getAccessErrorValue()Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 3

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0

    .line 213
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ACCESS_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMemberErrorValue()Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;
    .locals 3

    .line 259
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 262
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    return-object v0

    .line 260
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MEMBER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNoExplicitAccessValue()Lcom/dropbox/core/v2/sharing/AddFolderMemberError;
    .locals 3

    .line 310
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    .line 313
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    return-object v0

    .line 311
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NO_EXPLICIT_ACCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 351
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->accessErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->memberErrorValue:Lcom/dropbox/core/v2/sharing/SharedFolderMemberError;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->noExplicitAccessValue:Lcom/dropbox/core/v2/sharing/AddFolderMemberError;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAccessError()Z
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->ACCESS_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientPlan()Z
    .locals 2

    .line 324
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->INSUFFICIENT_PLAN:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMemberError()Z
    .locals 2

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoExplicitAccess()Z
    .locals 2

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->NO_EXPLICIT_ACCESS:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNoPermission()Z
    .locals 2

    .line 335
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->NO_PERMISSION:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 346
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError;->_tag:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 397
    sget-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 409
    sget-object v0, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/UpdateFolderMemberError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
