.class public Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;
.super Ljava/lang/Object;
.source "LegalHoldsPolicyUpdateArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected description:Ljava/lang/String;

.field protected final id:Ljava/lang/String;

.field protected members:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected name:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 165
    const-string v0, "^pid_dbhid:.+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->id:Ljava/lang/String;

    const/4 p1, 0x0

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->name:Ljava/lang/String;

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->description:Ljava/lang/String;

    .line 171
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->members:Ljava/util/List;

    return-void

    .line 166
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'id\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 163
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'id\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;
    .locals 5

    .line 245
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->description:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->members:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 207
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f5

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 208
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'description\' is longer than 501"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 211
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public withMembers(Ljava/util/List;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 228
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 230
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'members\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 234
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->members:Ljava/util/List;

    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;
    .locals 2

    if-eqz p1, :cond_1

    .line 186
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8c

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 187
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'name\' is longer than 140"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 190
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateArg$Builder;->name:Ljava/lang/String;

    return-object p0
.end method
