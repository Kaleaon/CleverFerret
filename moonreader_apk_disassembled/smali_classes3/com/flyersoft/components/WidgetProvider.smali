.class public Lcom/flyersoft/components/WidgetProvider;
.super Landroid/appwidget/AppWidgetProvider;
.source "WidgetProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 91
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 92
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "widget-onRecive:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 16

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    .line 24
    const-string v2, "options1002"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "useDynamicColor"

    sget-boolean v6, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    .line 25
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    sput-boolean v4, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    .line 26
    sget-boolean v4, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v4, :cond_0

    .line 27
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "customDynamicColor"

    sget v5, Lcom/flyersoft/tools/A;->customDynamicColor:I

    .line 28
    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    sput v2, Lcom/flyersoft/tools/A;->customDynamicColor:I

    .line 29
    invoke-static {v0}, Lcom/flyersoft/tools/C;->initDynamicColors(Landroid/content/Context;)V

    .line 32
    :cond_0
    const-string v2, "widget"

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 33
    array-length v4, v1

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_c

    aget v6, v1, v5

    .line 34
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, ""

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v9, "#0"

    invoke-interface {v2, v7, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 35
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, "_style"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v2, v10, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    .line 36
    new-instance v11, Landroid/widget/RemoteViews;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    if-nez v10, :cond_1

    .line 37
    sget v14, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history:I

    goto :goto_1

    :cond_1
    if-ne v10, v13, :cond_2

    .line 38
    sget v14, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_night:I

    goto :goto_1

    :cond_2
    const/4 v14, 0x2

    if-ne v10, v14, :cond_3

    .line 39
    sget v14, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_alpha:I

    goto :goto_1

    .line 40
    :cond_3
    sget v14, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_amoled:I

    :goto_1
    invoke-direct {v11, v12, v14}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 42
    new-instance v12, Landroid/content/Intent;

    const-class v14, Lcom/flyersoft/components/WidgetService;

    invoke-direct {v12, v0, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 43
    const-string v14, "appWidgetId"

    invoke-virtual {v12, v14, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 44
    invoke-virtual {v12, v13}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 45
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->listView1:I

    invoke-virtual {v11, v14, v12}, Landroid/widget/RemoteViews;->setRemoteAdapter(ILandroid/content/Intent;)V

    .line 47
    sget-boolean v14, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v14, :cond_7

    if-eqz v10, :cond_4

    if-ne v10, v13, :cond_7

    .line 48
    :cond_4
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->topBar:I

    if-nez v10, :cond_5

    .line 49
    sget v15, Lcom/flyersoft/tools/C;->colorPrimary:I

    goto :goto_2

    :cond_5
    sget v15, Lcom/flyersoft/tools/C;->colorOnSecondary2:I

    .line 48
    :goto_2
    const-string v3, "setBackgroundColor"

    invoke-virtual {v11, v14, v3, v15}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 50
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->listView1:I

    if-nez v10, :cond_6

    .line 51
    sget v10, Lcom/flyersoft/tools/C;->colorSecondaryContainer:I

    goto :goto_3

    :cond_6
    sget v10, Lcom/flyersoft/tools/C;->colorSecondaryContainer2:I

    .line 50
    :goto_3
    invoke-virtual {v11, v14, v3, v10}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 52
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    const/4 v10, -0x1

    invoke-virtual {v11, v3, v10}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 55
    :cond_7
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 56
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    .line 57
    array-length v7, v1

    if-le v7, v13, :cond_8

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    goto :goto_4

    :cond_8
    sget v7, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    .line 56
    :goto_4
    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v3, v7}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    goto :goto_6

    .line 58
    :cond_9
    const-string v3, "#1"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 59
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    array-length v9, v1

    if-ne v9, v13, :cond_a

    goto :goto_5

    :cond_a
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_5
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 59
    invoke-virtual {v11, v3, v7}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    goto :goto_6

    .line 62
    :cond_b
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    invoke-virtual {v11, v3, v7}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 65
    :goto_6
    new-instance v3, Landroid/content/Intent;

    const-class v7, Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v3, v0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x2710

    sub-long/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v7, 0xa000000

    const/4 v8, 0x0

    .line 69
    invoke-static {v0, v8, v3, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 70
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->listView1:I

    invoke-virtual {v11, v7, v3}, Landroid/widget/RemoteViews;->setPendingIntentTemplate(ILandroid/app/PendingIntent;)V

    .line 77
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->imageView1:I

    const/16 v7, 0x8

    invoke-virtual {v11, v3, v7}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 79
    new-instance v3, Landroid/content/Intent;

    const-class v7, Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v3, v0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 80
    const-string v7, "android.intent.action.VIEW"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v7, 0xc000000

    const/4 v8, 0x0

    .line 81
    invoke-static {v0, v8, v3, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 82
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    invoke-virtual {v11, v7, v3}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    move-object/from16 v3, p2

    .line 84
    invoke-virtual {v3, v6, v11}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    move-object/from16 v6, p0

    .line 85
    invoke-super {v6, v0, v12}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    add-int/lit8 v5, v5, 0x1

    const/4 v3, 0x0

    goto/16 :goto_0

    :cond_c
    move-object/from16 v6, p0

    return-void
.end method
