.class public Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;
.super Ljava/lang/Object;
.source "LegalHoldsPolicyCreateArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected description:Ljava/lang/String;

.field protected endDate:Ljava/util/Date;

.field protected final members:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final name:Ljava/lang/String;

.field protected startDate:Ljava/util/Date;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 181
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8c

    if-gt v0, v1, :cond_3

    .line 184
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->name:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 188
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 190
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 193
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->members:Ljava/util/List;

    const/4 p1, 0x0

    .line 194
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->description:Ljava/lang/String;

    .line 195
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->startDate:Ljava/util/Date;

    .line 196
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->endDate:Ljava/util/Date;

    return-void

    .line 186
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 182
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'name\' is longer than 140"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 179
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;
    .locals 6

    .line 251
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->members:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->description:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->startDate:Ljava/util/Date;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->endDate:Ljava/util/Date;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 212
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f5

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 213
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'description\' is longer than 501"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 216
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withEndDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;
    .locals 0

    .line 240
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->endDate:Ljava/util/Date;

    return-object p0
.end method

.method public withStartDate(Ljava/util/Date;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;
    .locals 0

    .line 228
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyCreateArg$Builder;->startDate:Ljava/util/Date;

    return-object p0
.end method
