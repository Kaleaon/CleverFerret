.class public Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;
.super Ljava/lang/Object;
.source "LegalHoldHeldRevisionMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;
    }
.end annotation


# instance fields
.field protected final authorEmail:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final authorMemberId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final contentHash:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final fileType:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final newFilename:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final originalFilePath:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final originalRevisionId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final serverModified:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final size:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/dropbox/core/v2/team/TeamMemberStatus;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Lcom/dropbox/core/v2/team/TeamMemberStatus;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_f

    .line 81
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->newFilename:Ljava/lang/String;

    if-eqz p2, :cond_e

    .line 85
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x9

    if-lt p1, v0, :cond_d

    .line 88
    const-string p1, "[0-9a-f]+"

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 91
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalRevisionId:Ljava/lang/String;

    if-eqz p3, :cond_b

    .line 95
    const-string p1, "(/(.|[\\r\\n])*)?"

    invoke-static {p1, p3}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 98
    iput-object p3, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalFilePath:Ljava/lang/String;

    if-eqz p4, :cond_9

    .line 102
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->serverModified:Ljava/util/Date;

    if-eqz p5, :cond_8

    .line 106
    iput-object p5, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberId:Ljava/lang/String;

    if-eqz p6, :cond_7

    .line 110
    iput-object p6, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    if-eqz p7, :cond_6

    .line 114
    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0xff

    if-gt p1, p2, :cond_5

    .line 117
    const-string p1, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {p1, p7}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 120
    iput-object p7, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorEmail:Ljava/lang/String;

    if-eqz p8, :cond_3

    .line 124
    iput-object p8, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->fileType:Ljava/lang/String;

    .line 125
    iput-wide p9, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->size:J

    if-eqz p11, :cond_2

    .line 129
    invoke-virtual {p11}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x40

    if-lt p1, p2, :cond_1

    .line 132
    invoke-virtual {p11}, Ljava/lang/String;->length()I

    move-result p1

    if-gt p1, p2, :cond_0

    .line 135
    iput-object p11, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->contentHash:Ljava/lang/String;

    return-void

    .line 133
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 130
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 127
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'contentHash\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 122
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'fileType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 118
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'authorEmail\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 115
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'authorEmail\' is longer than 255"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 112
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'authorEmail\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 108
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'authorMemberStatus\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 104
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'authorMemberId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 100
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'serverModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 96
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'originalFilePath\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 93
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'originalFilePath\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'originalRevisionId\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'originalRevisionId\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 83
    :cond_e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'originalRevisionId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 79
    :cond_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newFilename\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 266
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 267
    check-cast p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;

    .line 268
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->newFilename:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->newFilename:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalRevisionId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalRevisionId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 269
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalFilePath:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalFilePath:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    .line 270
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->serverModified:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->serverModified:Ljava/util/Date;

    if-eq v2, v3, :cond_5

    .line 271
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberId:Ljava/lang/String;

    if-eq v2, v3, :cond_6

    .line 272
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    if-eq v2, v3, :cond_7

    .line 273
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/team/TeamMemberStatus;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorEmail:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorEmail:Ljava/lang/String;

    if-eq v2, v3, :cond_8

    .line 274
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->fileType:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->fileType:Ljava/lang/String;

    if-eq v2, v3, :cond_9

    .line 275
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_9
    iget-wide v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->size:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->size:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_b

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->contentHash:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->contentHash:Ljava/lang/String;

    if-eq v2, p1, :cond_a

    .line 277
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    :cond_a
    return v0

    :cond_b
    return v1
.end method

.method public getAuthorEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorMemberId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberId:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorMemberStatus()Lcom/dropbox/core/v2/team/TeamMemberStatus;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    return-object v0
.end method

.method public getContentHash()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->contentHash:Ljava/lang/String;

    return-object v0
.end method

.method public getFileType()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->fileType:Ljava/lang/String;

    return-object v0
.end method

.method public getNewFilename()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->newFilename:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalFilePath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalRevisionId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalRevisionId:Ljava/lang/String;

    return-object v0
.end method

.method public getServerModified()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->serverModified:Ljava/util/Date;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 224
    iget-wide v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->size:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 12

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->newFilename:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalRevisionId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->originalFilePath:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->serverModified:Ljava/util/Date;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberId:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorMemberStatus:Lcom/dropbox/core/v2/team/TeamMemberStatus;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->authorEmail:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->fileType:Ljava/lang/String;

    iget-wide v8, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->size:J

    .line 251
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    iget-object v9, p0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata;->contentHash:Ljava/lang/String;

    const/16 v10, 0xa

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v0, v10, v11

    const/4 v0, 0x1

    aput-object v1, v10, v0

    const/4 v0, 0x2

    aput-object v2, v10, v0

    const/4 v0, 0x3

    aput-object v3, v10, v0

    const/4 v0, 0x4

    aput-object v4, v10, v0

    const/4 v0, 0x5

    aput-object v5, v10, v0

    const/4 v0, 0x6

    aput-object v6, v10, v0

    const/4 v0, 0x7

    aput-object v7, v10, v0

    const/16 v0, 0x8

    aput-object v8, v10, v0

    const/16 v0, 0x9

    aput-object v9, v10, v0

    .line 242
    invoke-static {v10}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 287
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 299
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/LegalHoldHeldRevisionMetadata$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
