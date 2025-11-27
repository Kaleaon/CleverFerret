.class public abstract Lio/opencensus/stats/View$Name;
.super Ljava/lang/Object;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Name"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lio/opencensus/stats/View$Name;
    .locals 2

    .line 192
    invoke-static {p0}, Lio/opencensus/internal/StringUtils;->isPrintableString(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Name should be a ASCII string with a length no greater than 255 characters."

    .line 191
    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 194
    new-instance v0, Lio/opencensus/stats/AutoValue_View_Name;

    invoke-direct {v0, p0}, Lio/opencensus/stats/AutoValue_View_Name;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public abstract asString()Ljava/lang/String;
.end method
