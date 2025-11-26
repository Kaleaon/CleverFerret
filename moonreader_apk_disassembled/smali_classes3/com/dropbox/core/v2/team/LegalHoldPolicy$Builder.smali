.class public Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
.super Ljava/lang/Object;
.source "LegalHoldPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected activationTime:Ljava/util/Date;

.field protected description:Ljava/lang/String;

.field protected endDate:Ljava/util/Date;

.field protected final id:Ljava/lang/String;

.field protected final members:Lcom/dropbox/core/v2/team/MembersInfo;

.field protected final name:Ljava/lang/String;

.field protected final startDate:Ljava/util/Date;

.field protected final status:Lcom/dropbox/core/v2/team/LegalHoldStatus;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;)V
    .locals 1

    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_6

    .line 245
    const-string v0, "^pid_dbhid:.+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 248
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->id:Ljava/lang/String;

    if-eqz p2, :cond_4

    .line 252
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x8c

    if-gt p1, v0, :cond_3

    .line 255
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->name:Ljava/lang/String;

    if-eqz p3, :cond_2

    .line 259
    iput-object p3, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    if-eqz p4, :cond_1

    .line 263
    iput-object p4, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    if-eqz p5, :cond_0

    .line 267
    invoke-static {p5}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->startDate:Ljava/util/Date;

    const/4 p1, 0x0

    .line 268
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->description:Ljava/lang/String;

    .line 269
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->activationTime:Ljava/util/Date;

    .line 270
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->endDate:Ljava/util/Date;

    return-void

    .line 265
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'startDate\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 261
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'status\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 257
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 253
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'name\' is longer than 140"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 250
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 246
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 243
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/LegalHoldPolicy;
    .locals 9

    .line 326
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldPolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->members:Lcom/dropbox/core/v2/team/MembersInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->status:Lcom/dropbox/core/v2/team/LegalHoldStatus;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->startDate:Ljava/util/Date;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->description:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->activationTime:Ljava/util/Date;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->endDate:Ljava/util/Date;

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/team/LegalHoldPolicy;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/team/MembersInfo;Lcom/dropbox/core/v2/team/LegalHoldStatus;Ljava/util/Date;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public withActivationTime(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
    .locals 0

    .line 303
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->activationTime:Ljava/util/Date;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 286
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f5

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 287
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'description\' is longer than 501"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 290
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withEndDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;
    .locals 0

    .line 315
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldPolicy$Builder;->endDate:Ljava/util/Date;

    return-object p0
.end method
