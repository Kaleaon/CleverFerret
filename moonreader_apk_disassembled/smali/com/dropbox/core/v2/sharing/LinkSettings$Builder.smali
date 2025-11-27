.class public Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;
.super Ljava/lang/Object;
.source "LinkSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/LinkSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

.field protected expiry:Lcom/dropbox/core/v2/sharing/LinkExpiry;

.field protected password:Lcom/dropbox/core/v2/sharing/LinkPassword;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 126
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 127
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 128
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->expiry:Lcom/dropbox/core/v2/sharing/LinkExpiry;

    .line 129
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->password:Lcom/dropbox/core/v2/sharing/LinkPassword;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/LinkSettings;
    .locals 5

    .line 188
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkSettings;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->expiry:Lcom/dropbox/core/v2/sharing/LinkExpiry;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->password:Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/sharing/LinkSettings;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/dropbox/core/v2/sharing/LinkExpiry;Lcom/dropbox/core/v2/sharing/LinkPassword;)V

    return-object v0
.end method

.method public withAccessLevel(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->accessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object p0
.end method

.method public withAudience(Lcom/dropbox/core/v2/sharing/LinkAudience;)Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object p0
.end method

.method public withExpiry(Lcom/dropbox/core/v2/sharing/LinkExpiry;)Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;
    .locals 0

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->expiry:Lcom/dropbox/core/v2/sharing/LinkExpiry;

    return-object p0
.end method

.method public withPassword(Lcom/dropbox/core/v2/sharing/LinkPassword;)Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/LinkSettings$Builder;->password:Lcom/dropbox/core/v2/sharing/LinkPassword;

    return-object p0
.end method
