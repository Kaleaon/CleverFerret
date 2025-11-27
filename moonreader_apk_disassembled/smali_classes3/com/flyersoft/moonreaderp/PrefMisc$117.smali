.class Lcom/flyersoft/moonreaderp/PrefMisc$117;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 3162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .line 3164
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_2

    .line 3165
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3166
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3167
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    if-eqz p2, :cond_1

    const/16 v0, 0x8

    .line 3169
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v3

    if-nez v3, :cond_0

    .line 3170
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$117$1;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$117$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$117;)V

    invoke-virtual {v0, v3, v2, v4}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    goto :goto_0

    .line 3185
    :cond_0
    sput v0, Lcom/flyersoft/tools/A;->syncType:I

    .line 3186
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3187
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_2

    .line 3188
    sget-boolean v0, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, v0}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    goto :goto_0

    .line 3191
    :cond_1
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 3193
    :cond_2
    :goto_0
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-ne p1, v0, :cond_5

    .line 3194
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3195
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3196
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    if-eqz p2, :cond_4

    const/4 v0, 0x6

    .line 3198
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v3

    if-nez v3, :cond_3

    .line 3199
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefMisc$117$2;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$117$2;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$117;)V

    invoke-virtual {v0, v3, v2, v4}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    goto :goto_1

    .line 3214
    :cond_3
    sput v0, Lcom/flyersoft/tools/A;->syncType:I

    .line 3215
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3216
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_5

    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_5

    .line 3217
    sget-boolean v0, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, v0}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    goto :goto_1

    .line 3220
    :cond_4
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 3222
    :cond_5
    :goto_1
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-ne p1, v0, :cond_7

    .line 3223
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3224
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3225
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    if-eqz p2, :cond_6

    const/4 v0, 0x2

    .line 3227
    sput v0, Lcom/flyersoft/tools/A;->syncType:I

    .line 3228
    sget-object v3, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v3, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3229
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/cloud/Cloud;->validateAccount(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 3230
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_7

    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_7

    .line 3231
    sget-boolean v0, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, v0}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    goto :goto_2

    .line 3233
    :cond_6
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 3235
    :cond_7
    :goto_2
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-ne p1, v0, :cond_9

    .line 3236
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncFtpCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3237
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3238
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncDropboxCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    if-eqz p2, :cond_8

    const/4 p2, 0x4

    .line 3240
    sput p2, Lcom/flyersoft/tools/A;->syncType:I

    .line 3241
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3242
    invoke-static {p2}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p2

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/cloud/Cloud;->validateAccount(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 3243
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_9

    sget-boolean p1, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz p1, :cond_9

    .line 3244
    sget-boolean p1, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, p1}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    return-void

    .line 3246
    :cond_8
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    :cond_9
    return-void
.end method
