.class public final synthetic Lcom/facebook/fresco/vito/source/ImageSourceProvider$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 0
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/facebook/fresco/vito/source/ImageSourceProvider;->$r8$lambda$FKl0CYo_hAQAjQkppfKF1kkVO-s(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method
