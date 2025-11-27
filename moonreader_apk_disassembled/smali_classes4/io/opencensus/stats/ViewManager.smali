.class public abstract Lio/opencensus/stats/ViewManager;
.super Ljava/lang/Object;
.source "ViewManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getAllExportedViews()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getView(Lio/opencensus/stats/View$Name;)Lio/opencensus/stats/ViewData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract registerView(Lio/opencensus/stats/View;)V
.end method
