.class public final synthetic Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lbolts/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/facebook/datasource/SimpleDataSource;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/datasource/SimpleDataSource;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/datasource/SimpleDataSource;

    return-void
.end method


# virtual methods
.method public final then(Lbolts/Task;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/datasource/SimpleDataSource;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ImagePipeline;->$r8$lambda$OhzPD2X2Xa-maKNQDZrlF88bvU0(Lcom/facebook/datasource/SimpleDataSource;Lbolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method
