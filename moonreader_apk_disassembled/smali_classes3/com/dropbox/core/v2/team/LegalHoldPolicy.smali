.class public Lcom/dropbox/core/v2/team/LegalHoldPolicy;
.super Ljava/lang/Object;
.source "LegalHoldPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;,
        Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
    }
.end annotation


# instance fields
.field protected final activationTime:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final description:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final endDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final id:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final members:Lcom/dropbox/core/v2/team/MembersInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final startDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final status:Lcom/dropbox/core/v2/team/LegalHoldStatus;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;)V
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/team/MembersInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/team/LegalHoldStatus;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 122
    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/team/LegalHoldPolicy;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/team/MembersInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/team/LegalHoldStatus;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_8

    .line 70
    const-string v0, "^pid_dbhid:.+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 73
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->id:Ljava/lang/String;

    if-eqz p2, :cond_6

    .line 77
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x8c

    if-gt p1, v0, :cond_5

    .line 80
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->name:Ljava/lang/String;

    if-eqz p6, :cond_1

    .line 82
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x1f5

    if-gt p1, p2, :cond_0

    goto :goto_0

    .line 83
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'description\' is longer than 501"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_1
    :goto_0
    iput-object p6, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->description:Ljava/lang/String;

    .line 87
    invoke-static {p7}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->activationTime:Ljava/util/Date;

    if-eqz p3, :cond_4

    .line 91
    iput-object p3, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    if-eqz p4, :cond_3

    .line 95
    iput-object p4, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    if-eqz p5, :cond_2

    .line 99
    invoke-static {p5}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->startDate:Ljava/util/Date;

    .line 100
    invoke-static {p8}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->endDate:Ljava/util/Date;

    return-void

    .line 97
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'startDate\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 93
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'status\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 78
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'name\' is longer than 140"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 75
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 71
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 68
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
    .locals 6

    .line 224
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;)V

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

    .line 354
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 355
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;

    .line 356
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->id:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 357
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    if-eq v2, v3, :cond_4

    .line 358
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/team/MembersInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    if-eq v2, v3, :cond_5

    .line 359
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/team/LegalHoldStatus;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->startDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->startDate:Ljava/util/Date;

    if-eq v2, v3, :cond_6

    .line 360
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->description:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->description:Ljava/lang/String;

    if-eq v2, v3, :cond_7

    if-eqz v2, :cond_9

    .line 361
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->activationTime:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->activationTime:Ljava/util/Date;

    if-eq v2, v3, :cond_8

    if-eqz v2, :cond_9

    .line 362
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->endDate:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->endDate:Ljava/util/Date;

    if-eq v2, p1, :cond_a

    if-eqz v2, :cond_9

    .line 363
    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_0

    :cond_9
    return v1

    :cond_a
    :goto_0
    return v0

    :cond_b
    return v1
.end method

.method public getActivationTime()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->activationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getEndDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 202
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->endDate:Ljava/util/Date;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMembers()Lcom/dropbox/core/v2/team/MembersInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStartDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->startDate:Ljava/util/Date;

    return-object v0
.end method

.method public getStatus()Lcom/dropbox/core/v2/team/LegalHoldStatus;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    return-object v0
.end method

.method public hashCode()I
    .locals 10

    .line 332
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->description:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->activationTime:Ljava/util/Date;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->startDate:Ljava/util/Date;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;->endDate:Ljava/util/Date;

    const/16 v8, 0x8

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v0, 0x1

    aput-object v1, v8, v0

    const/4 v0, 0x2

    aput-object v2, v8, v0

    const/4 v0, 0x3

    aput-object v3, v8, v0

    const/4 v0, 0x4

    aput-object v4, v8, v0

    const/4 v0, 0x5

    aput-object v5, v8, v0

    const/4 v0, 0x6

    aput-object v6, v8, v0

    const/4 v0, 0x7

    aput-object v7, v8, v0

    invoke-static {v8}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 373
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 385
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
