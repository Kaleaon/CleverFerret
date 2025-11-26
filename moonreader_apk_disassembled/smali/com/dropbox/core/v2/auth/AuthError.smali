.class public final Lcom/dropbox/core/v2/auth/AuthError;
.super Ljava/lang/Object;
.source "AuthError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/auth/AuthError$Serializer;,
        Lcom/dropbox/core/v2/auth/AuthError$Tag;
    }
.end annotation


# static fields
.field public static final EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final OTHER:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError;

.field public static final USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field private missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError;

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError;

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError;

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError;

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError;

    .line 104
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError;

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->OTHER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AuthError;->withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError;->OTHER:Lcom/dropbox/core/v2/auth/AuthError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/auth/AuthError;)Lcom/dropbox/core/v2/auth/TokenScopeError;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

    return-object p0
.end method

.method public static missingScope(Lcom/dropbox/core/v2/auth/TokenScopeError;)Lcom/dropbox/core/v2/auth/AuthError;
    .locals 2

    if-eqz p0, :cond_0

    .line 254
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->MISSING_SCOPE:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/auth/AuthError;->withTagAndMissingScope(Lcom/dropbox/core/v2/auth/AuthError$Tag;Lcom/dropbox/core/v2/auth/TokenScopeError;)Lcom/dropbox/core/v2/auth/AuthError;

    move-result-object p0

    return-object p0

    .line 252
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/auth/AuthError$Tag;)Lcom/dropbox/core/v2/auth/AuthError;
    .locals 1

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    .line 131
    iput-object p1, v0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    return-object v0
.end method

.method private withTagAndMissingScope(Lcom/dropbox/core/v2/auth/AuthError$Tag;Lcom/dropbox/core/v2/auth/TokenScopeError;)Lcom/dropbox/core/v2/auth/AuthError;
    .locals 1

    .line 146
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AuthError;-><init>()V

    .line 147
    iput-object p1, v0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 148
    iput-object p2, v0, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

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

    .line 314
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/auth/AuthError;

    if-eqz v2, :cond_5

    .line 315
    check-cast p1, Lcom/dropbox/core/v2/auth/AuthError;

    .line 316
    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 319
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/auth/AuthError$1;->$SwitchMap$com$dropbox$core$v2$auth$AuthError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/auth/AuthError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 331
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

    iget-object p1, p1, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/auth/TokenScopeError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getMissingScopeValue()Lcom/dropbox/core/v2/auth/TokenScopeError;
    .locals 3

    .line 269
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->MISSING_SCOPE:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    .line 272
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

    return-object v0

    .line 270
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MISSING_SCOPE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/auth/AuthError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 299
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/auth/AuthError;->missingScopeValue:Lcom/dropbox/core/v2/auth/TokenScopeError;

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

.method public isExpiredAccessToken()Z
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidAccessToken()Z
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidSelectAdmin()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidSelectUser()Z
    .locals 2

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMissingScope()Z
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->MISSING_SCOPE:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 294
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->OTHER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRouteAccessDenied()Z
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserSuspended()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/auth/AuthError$Tag;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AuthError;->_tag:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 347
    sget-object v0, Lcom/dropbox/core/v2/auth/AuthError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/auth/AuthError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/auth/AuthError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 359
    sget-object v0, Lcom/dropbox/core/v2/auth/AuthError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/auth/AuthError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/auth/AuthError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
