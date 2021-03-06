module Admin.Controller.Bands where

import           Admin.Controller.Prelude
import           Admin.View.Bands.Edit
import           Admin.View.Bands.Index
import           Admin.View.Bands.New
import           Admin.View.Bands.Show
import           Data.Functor             ((<&>))
import           System.Environment       (lookupEnv)

instance Controller BandsController where
    beforeAction = do
        pass <- liftIO (lookupEnv "ATTICS_ADMIN_PASSWORD")
        basicAuth "zac" (fromMaybe "zac" (pass <&> cs)) ""

    action BandsAction = do
        bands <- fetchBands
        render IndexView { .. }

    action NewBandAction = do
        let band = newRecord
        render NewView { .. }

    action ShowBandAction { bandId } = do
        band <- fetch bandId
        render ShowView { .. }

    action EditBandAction { bandId } = do
        band <- fetch bandId
        render EditView { .. }

    action UpdateBandAction { bandId } = do
        band <- fetch bandId
        band
            |> buildBand'
            |> ifValid \case
                Left band -> render EditView { .. }
                Right band -> do
                    band <- band |> updateRecord
                    setSuccessMessage "Band updated"
                    redirectTo EditBandAction { .. }

    action CreateBandAction = do
        let band = newRecord @Band
        band
            |> buildBand
            |> ifValid \case
                Left band -> render NewView { .. }
                Right band -> do
                    band <- band |> createRecord
                    setSuccessMessage "Band created"
                    redirectTo BandsAction

    action DeleteBandAction { bandId } = do
        band <- fetch bandId
        deleteRecord band
        setSuccessMessage "Band deleted"
        redirectTo BandsAction

buildBand band = band
    |> fill @["collection","name","url","logoUrl"]

buildBand' band = band
    |> fill @["collection","name","url","logoUrl","updatedAt"]
