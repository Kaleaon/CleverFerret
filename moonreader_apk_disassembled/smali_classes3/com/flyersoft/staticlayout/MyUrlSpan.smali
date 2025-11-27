.class public Lcom/flyersoft/staticlayout/MyUrlSpan;
.super Landroid/text/style/ClickableSpan;
.source "MyUrlSpan.java"

# interfaces
.implements Landroid/text/ParcelableSpan;


# instance fields
.field public clicked:Z

.field public link_color:Ljava/lang/Integer;

.field public link_no_underline:Z

.field public link_visited_color:Ljava/lang/Integer;

.field private final mURL:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->mURL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->mURL:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getSpanTypeId()I
    .locals 1

    const/16 v0, 0x6e

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 78
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyUrlSpan;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->mURL:Ljava/lang/String;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 49
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyUrlSpan;->getURL()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 51
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 52
    const-string v0, "com.android.browser.application_id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 55
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 2

    .line 62
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->clicked:Z

    if-eqz v0, :cond_3

    .line 63
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableLinkColor:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_visited_color:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    .line 65
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableLinkColor:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_color:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 66
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, -0x64

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    goto :goto_0

    .line 68
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    goto :goto_0

    :cond_2
    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    goto :goto_0

    .line 70
    :cond_3
    sget-boolean v0, Lcom/flyersoft/tools/A;->disableLinkColor:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_color:Ljava/lang/Integer;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    .line 71
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_5

    sget v0, Lcom/flyersoft/tools/A;->linkColorNight:I

    goto :goto_0

    :cond_5
    sget v0, Lcom/flyersoft/tools/A;->linkColor:I

    .line 73
    :goto_0
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 74
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->link_no_underline:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 39
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MyUrlSpan;->mURL:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyUrlSpan;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
