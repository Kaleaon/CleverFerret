.class public Lcom/flyersoft/components/WidgetService;
.super Landroid/widget/RemoteViewsService;
.source "WidgetService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/widget/RemoteViewsService;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetViewFactory(Landroid/content/Intent;)Landroid/widget/RemoteViewsService$RemoteViewsFactory;
    .locals 2

    .line 30
    new-instance v0, Lcom/flyersoft/components/WidgetFactory;

    invoke-virtual {p0}, Lcom/flyersoft/components/WidgetService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/components/WidgetFactory;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    return-object v0
.end method
