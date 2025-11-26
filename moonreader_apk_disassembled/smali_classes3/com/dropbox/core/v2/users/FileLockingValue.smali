.class public final Lcom/dropbox/core/v2/users/FileLockingValue;
.super Ljava/lang/Object;
.source "FileLockingValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;,
        Lcom/dropbox/core/v2/users/FileLockingValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/users/FileLockingValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

.field private enabledValue:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/users/FileLockingValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/FileLockingValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->OTHER:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/users/FileLockingValue;->withTag(Lcom/dropbox/core/v2/users/FileLockingValue$Tag;)Lcom/dropbox/core/v2/users/FileLockingValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/users/FileLockingValue;->OTHER:Lcom/dropbox/core/v2/users/FileLockingValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/users/FileLockingValue;)Ljava/lang/Boolean;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

    return-object p0
.end method

.method public static enabled(Z)Lcom/dropbox/core/v2/users/FileLockingValue;
    .locals 2

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/users/FileLockingValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/FileLockingValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->ENABLED:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/FileLockingValue;->withTagAndEnabled(Lcom/dropbox/core/v2/users/FileLockingValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/users/FileLockingValue;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/users/FileLockingValue$Tag;)Lcom/dropbox/core/v2/users/FileLockingValue;
    .locals 1

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/users/FileLockingValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/FileLockingValue;-><init>()V

    .line 81
    iput-object p1, v0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    return-object v0
.end method

.method private withTagAndEnabled(Lcom/dropbox/core/v2/users/FileLockingValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/users/FileLockingValue;
    .locals 1

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/users/FileLockingValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/FileLockingValue;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    .line 96
    iput-object p2, v0, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

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

    .line 193
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/users/FileLockingValue;

    if-eqz v2, :cond_5

    .line 194
    check-cast p1, Lcom/dropbox/core/v2/users/FileLockingValue;

    .line 195
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 198
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/users/FileLockingValue$1;->$SwitchMap$com$dropbox$core$v2$users$FileLockingValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 200
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

    if-ne v2, p1, :cond_5

    return v0

    :cond_5
    return v1
.end method

.method public getEnabledValue()Z
    .locals 3

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->ENABLED:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ENABLED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->enabledValue:Ljava/lang/Boolean;

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

.method public isEnabled()Z
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->ENABLED:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/FileLockingValue$Tag;->OTHER:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/users/FileLockingValue$Tag;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FileLockingValue;->_tag:Lcom/dropbox/core/v2/users/FileLockingValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 214
    sget-object v0, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 226
    sget-object v0, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FileLockingValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
