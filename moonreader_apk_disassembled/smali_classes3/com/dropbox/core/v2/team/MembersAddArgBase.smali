.class Lcom/dropbox/core/v2/team/MembersAddArgBase;
.super Ljava/lang/Object;
.source "MembersAddArgBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;
    }
.end annotation


# instance fields
.field protected final forceAsync:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, v0}, Lcom/dropbox/core/v2/team/MembersAddArgBase;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/MembersAddArgBase;->forceAsync:Z

    return-void
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

    .line 68
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 69
    check-cast p1, Lcom/dropbox/core/v2/team/MembersAddArgBase;

    .line 70
    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/MembersAddArgBase;->forceAsync:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/team/MembersAddArgBase;->forceAsync:Z

    if-ne v2, p1, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public getForceAsync()Z
    .locals 1

    .line 48
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/MembersAddArgBase;->forceAsync:Z

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 53
    iget-boolean v0, p0, Lcom/dropbox/core/v2/team/MembersAddArgBase;->forceAsync:Z

    .line 54
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 53
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 79
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 91
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddArgBase$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
