.class public Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;
.super Ljava/lang/Object;
.source "TfaChangeStatusDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

.field protected previousValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

.field protected usedRescueCode:Ljava/lang/Boolean;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/TfaConfiguration;)V
    .locals 1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 136
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->usedRescueCode:Ljava/lang/Boolean;

    return-void

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'newValue\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails;
    .locals 4

    .line 175
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->usedRescueCode:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails;-><init>(Lcom/dropbox/core/v2/teamlog/TfaConfiguration;Lcom/dropbox/core/v2/teamlog/TfaConfiguration;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withPreviousValue(Lcom/dropbox/core/v2/teamlog/TfaConfiguration;)Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;
    .locals 0

    .line 150
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/TfaConfiguration;

    return-object p0
.end method

.method public withUsedRescueCode(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TfaChangeStatusDetails$Builder;->usedRescueCode:Ljava/lang/Boolean;

    return-object p0
.end method
